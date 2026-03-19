import boto3
import tkinter as tk
from tkinter import messagebox

# ----------------------------
# AWS Credentials
# ----------------------------
AWS_ACCESS_KEY = "<your-access-key-id>"
AWS_SECRET_KEY = "<your-secret-access-key>"
REGION_NAME = "ap-southeast-2"

# ----------------------------
# Allowed Instances
# ----------------------------
instances = {
    "DEV-SYD-DE02 (User1)": "i-0000000000example1",
    "DEV-SYD-DE03 (User2)": "i-0000000000example2"
}

# Available instance types with detailed specs
INSTANCE_TYPE_SPECS = {
    "c7i.4xlarge": {
        "vcpu": 16,
        "memory_gb": 32,
        "gpu": "None",
        "gpu_memory": "N/A",
        "description": "Compute Optimized",
        "cost_usd_per_hour": 1.66
    },
    "g6.4xlarge": {
        "vcpu": 16,
        "memory_gb": 64,
        "gpu": "1x NVIDIA L4",
        "gpu_memory": "24 GB",
        "description": "GPU Instance",
        "cost_usd_per_hour": 2.45
    }
}

AVAILABLE_TYPES = list(INSTANCE_TYPE_SPECS.keys())

# ----------------------------
# Boto3 EC2 Client
# ----------------------------
ec2_client = boto3.client(
    "ec2",
    aws_access_key_id=AWS_ACCESS_KEY,
    aws_secret_access_key=AWS_SECRET_KEY,
    region_name=REGION_NAME,
)

# ----------------------------
# Functions
# ----------------------------
def get_detailed_status(instance_id):
    """Fetches Power State, Health Check status, and Instance Type"""
    try:
        # Get Power State and Instance Type
        desc_res = ec2_client.describe_instances(InstanceIds=[instance_id])
        instance_data = desc_res["Reservations"][0]["Instances"][0]
        state = instance_data["State"]["Name"]
        instance_type = instance_data["InstanceType"]

        # Get Health Checks
        status_res = ec2_client.describe_instance_status(InstanceIds=[instance_id], IncludeAllInstances=True)
        
        if status_res["InstanceStatuses"]:
            status_info = status_res["InstanceStatuses"][0]
            system_status = status_info["SystemStatus"]["Status"]
            instance_status = status_info["InstanceStatus"]["Status"]
            
            if system_status == "ok" and instance_status == "ok":
                health = "2/2 Pass"
            elif state != "running":
                health = "N/A"
            else:
                health = "Check Failed"
        else:
            health = "N/A"
            
        return state, health, instance_type
    except Exception as e:
        return "Error", str(e), "Unknown"


def set_ui_status(name, state, health, instance_type):
    # Update State Color
    colors = {
        "running": "green",
        "stopped": "red",
        "pending": "orange",
        "stopping": "orange"
    }
    status_labels[name].config(text=state, fg=colors.get(state, "black"))
    
    # Update Health Color
    h_color = "green" if health == "2/2 Pass" else "red"
    if health == "N/A": h_color = "gray"
    health_labels[name].config(text=health, fg=h_color)
    
    # Update Instance Type
    type_labels[name].config(text=instance_type)


def refresh_status():
    for name, instance_id in instances.items():
        state, health, instance_type = get_detailed_status(instance_id)
        set_ui_status(name, state, health, instance_type)


def change_instance_type(name, instance_id):
    """Change the instance type - instance must be stopped first"""
    try:
        # Check current state
        state, _, current_type = get_detailed_status(instance_id)
        
        if state != "stopped":
            messagebox.showwarning("Warning", 
                f"Instance must be stopped before changing type.\nCurrent state: {state}")
            return
        
        # Create a popup window for type selection
        popup = tk.Toplevel(root)
        popup.title(f"Change Instance Type - {name}")
        popup.geometry("550x800")
        popup.resizable(False, False)
        
        # Current Type Section
        current_frame = tk.Frame(popup, bg="#e8f4f8", relief=tk.RIDGE, bd=2)
        current_frame.pack(fill=tk.X, padx=10, pady=10)
        
        tk.Label(current_frame, text=f"Current Instance Type", 
                font=("Arial", 12, "bold"), bg="#e8f4f8").pack(pady=5)
        tk.Label(current_frame, text=f"{current_type}", 
                font=("Arial", 10), bg="#e8f4f8").pack()
        
        if current_type in INSTANCE_TYPE_SPECS:
            specs = INSTANCE_TYPE_SPECS[current_type]
            tk.Label(current_frame, 
                    text=f"vCPU: {specs['vcpu']} | RAM: {specs['memory_gb']} GB | GPU: {specs['gpu']} | ${specs['cost_usd_per_hour']}/hr", 
                    font=("Arial", 9), bg="#e8f4f8", fg="#555").pack(pady=2)
        
        # Selection Section
        tk.Label(popup, text="Select New Instance Type:", 
                font=("Arial", 11, "bold")).pack(pady=(15, 10))
        
        selected_type = tk.StringVar(popup)
        selected_type.set(current_type)
        
        # Create radio buttons with detailed specs
        radio_frame = tk.Frame(popup)
        radio_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=5)
        
        for idx, instance_type in enumerate(AVAILABLE_TYPES):
            specs = INSTANCE_TYPE_SPECS[instance_type]
            
            # Frame for each option
            option_frame = tk.Frame(radio_frame, relief=tk.GROOVE, bd=2, bg="#f9f9f9")
            option_frame.pack(fill=tk.X, pady=5, padx=5)
            
            # Radio button and instance type name
            radio_btn = tk.Radiobutton(
                option_frame, 
                text=instance_type,
                variable=selected_type, 
                value=instance_type,
                font=("Arial", 10, "bold"),
                bg="#f9f9f9",
                activebackground="#f9f9f9"
            )
            radio_btn.pack(anchor=tk.W, padx=10, pady=5)
            
            # Description
            tk.Label(option_frame, text=f"📋 {specs['description']}", 
                    font=("Arial", 9), bg="#f9f9f9", fg="#666").pack(anchor=tk.W, padx=30)
            
            # Specs details
            specs_text = f"🖥️  vCPU: {specs['vcpu']}    💾 RAM: {specs['memory_gb']} GB"
            tk.Label(option_frame, text=specs_text, 
                    font=("Arial", 9), bg="#f9f9f9").pack(anchor=tk.W, padx=30, pady=2)
            
            # GPU info with highlighting
            gpu_text = f"🎮 GPU: {specs['gpu']}"
            if specs['gpu_memory'] != "N/A":
                gpu_text += f" ({specs['gpu_memory']})"
            
            gpu_color = "#006400" if specs['gpu'] != "None" else "#888"
            gpu_font = ("Arial", 9, "bold") if specs['gpu'] != "None" else ("Arial", 9)
            tk.Label(option_frame, text=gpu_text, 
                    font=gpu_font, bg="#f9f9f9", fg=gpu_color).pack(anchor=tk.W, padx=30, pady=(0, 2))

            # Cost info
            cost_text = f"💰 ${specs['cost_usd_per_hour']}/hr"
            tk.Label(option_frame, text=cost_text, 
                    font=("Arial", 9, "bold"), bg="#f9f9f9", fg="#d9534f").pack(anchor=tk.W, padx=30, pady=(0, 5))
        
        # Buttons frame
        button_frame = tk.Frame(popup)
        button_frame.pack(pady=15, fill=tk.X, expand=False)
        
        def apply_change():
            new_type = selected_type.get()
            if new_type == current_type:
                messagebox.showinfo("Info", "No change - same instance type selected.")
                popup.destroy()
                return
            
            # Simple confirmation
            confirm_msg = f"Change instance type from {current_type} to {new_type}?"
            
            if messagebox.askyesno("Confirm Change", confirm_msg):
                try:
                    ec2_client.modify_instance_attribute(
                        InstanceId=instance_id,
                        InstanceType={'Value': new_type}
                    )
                    messagebox.showinfo("Success", 
                        f"Instance type changed from {current_type} to {new_type}")
                    popup.destroy()
                    refresh_status()
                except Exception as e:
                    messagebox.showerror("Error", f"Failed to change instance type:\n{str(e)}")
        
        tk.Button(button_frame, text="Apply Change", bg="#28a745", fg="white", 
                 font=("Arial", 10, "bold"), width=15, height=2,
                 command=apply_change).pack(side=tk.LEFT, padx=15)
        
        tk.Button(button_frame, text="Cancel", bg="#dc3545", fg="white",
                 font=("Arial", 10, "bold"), width=15, height=2,
                 command=popup.destroy).pack(side=tk.RIGHT, padx=15)
        
    except Exception as e:
        messagebox.showerror("Error", str(e))


def start_instance(name, instance_id):
    try:
        ec2_client.start_instances(InstanceIds=[instance_id])
        messagebox.showinfo("Success", f"Instance '{name}' is starting.")
        set_ui_status(name, "pending", "Initializing...", "...")
    except Exception as e:
        messagebox.showerror("Error", str(e))


def stop_instance(name, instance_id):
    try:
        ec2_client.stop_instances(InstanceIds=[instance_id])
        messagebox.showinfo("Success", f"Instance '{name}' is stopping.")
        state, health, instance_type = get_detailed_status(instance_id)
        set_ui_status(name, "stopping", "N/A", instance_type)
    except Exception as e:
        messagebox.showerror("Error", str(e))


# ----------------------------
# Build Tkinter UI
# ----------------------------
root = tk.Tk()
root.title("AWS EC2 Instance Manager")

# Headers
headers = ["Instance Name", "Instance ID", "Instance Type", "Status", "Health Check", "Start", "Stop", "Change Type"]
for col, text in enumerate(headers):
    tk.Label(root, text=text, font=("Arial", 11, "bold"), padx=10, pady=5).grid(row=0, column=col)

status_labels = {}
health_labels = {}
type_labels = {}

# Populate rows
for i, (name, instance_id) in enumerate(instances.items(), start=1):
    # Instance Name
    tk.Label(root, text=name, width=25).grid(row=i, column=0, padx=10, pady=5)
    
    # Instance ID
    tk.Label(root, text=instance_id, width=20).grid(row=i, column=1, padx=10, pady=5)
    
    # Instance Type Label
    t_label = tk.Label(root, text="Loading...", width=15, fg="blue")
    t_label.grid(row=i, column=2, padx=10, pady=5)
    type_labels[name] = t_label

    # Status Label
    s_label = tk.Label(root, text="Loading...", width=12, fg="blue")
    s_label.grid(row=i, column=3, padx=10, pady=5)
    status_labels[name] = s_label
    
    # Health Label
    h_label = tk.Label(root, text="Loading...", width=12, fg="blue")
    h_label.grid(row=i, column=4, padx=10, pady=5)
    health_labels[name] = h_label

    # Start Button
    tk.Button(root, text="Start", bg="#1E90FF", fg="white", width=8,
              command=lambda n=name, iid=instance_id: start_instance(n, iid)).grid(row=i, column=5, padx=5)
    
    # Stop Button
    tk.Button(root, text="Stop", bg="#FF4500", fg="white", width=8,
              command=lambda n=name, iid=instance_id: stop_instance(n, iid)).grid(row=i, column=6, padx=5)
    
    # Change Type Button
    tk.Button(root, text="Change Type", bg="#9370DB", fg="white", width=12,
              command=lambda n=name, iid=instance_id: change_instance_type(n, iid)).grid(row=i, column=7, padx=5)

# Refresh button
tk.Button(root, text="↻ Refresh All", command=refresh_status, bg="lightblue", font=("Arial", 10, "bold")).grid(
    row=len(instances) + 1, column=0, columnspan=8, pady=10, sticky="we", padx=10
)

# Load initial statuses
refresh_status()

root.mainloop()
