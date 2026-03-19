import os
import boto3
import PySimpleGUI as sg

def get_bucket_list(access_key_id, secret_access_key):
    """Retrieves a list of all available S3 buckets.

    Args:
        access_key_id (str): The AWS Access Key ID.
        secret_access_key (str): The AWS Secret Access Key.

    Returns:
        list: A list of available S3 bucket names.
    """
    # Create an S3 client with the provided access credentials
    s3 = boto3.client('s3', aws_access_key_id=access_key_id, aws_secret_access_key=secret_access_key)

    try:
        # Retrieve the list of all S3 buckets
        response = s3.list_buckets()
        buckets = [bucket['Name'] for bucket in response['Buckets']]
        return buckets
    except Exception as e:
        sg.popup_error(f"Error retrieving S3 bucket list: {e}")
        return []

# Create the GUI layout
layout = [
    [
        sg.Column([
            [sg.Text("Access Key ID")],
            [sg.Input(key="-ACCESS_KEY_ID-", size=(40, 1))],
            [sg.Text("Secret Access Key")],
            [sg.Input(key="-SECRET_ACCESS_KEY-", password_char="*", size=(40, 1))],
            
        ]),
        sg.VSeparator(),
        sg.Column([
            [sg.Text("S3 Bucket")], [sg.Button("Search", key="-SEARCH_BUCKET-")],
            [sg.Listbox(values=[], size=(30, 6), key="-BUCKET_LIST-", enable_events=True)]
        ])
        
        
    
    ],
    [sg.HSeparator()],
    [
        sg.Column([
            [sg.Text("File Path")], [sg.Button("Browse", key="-BROWSE-", size=(10, 1))],
            [sg.Input(key="-FILE_PATH-", disabled=True, size=(40, 1))],
            [sg.Text("Object Name")],
            [sg.Input(key="-OBJECT_NAME-", disabled=True, size=(40, 1))]
            
        ]),
        sg.VSeparator(),
        sg.Column([
            [sg.Button("Upload", size=(28, 3), pad=(0,15))],
            [sg.Button("Cancel", size=(28, 1), pad=(0,0))]
        ])
    ]
]

# Create the window
window = sg.Window("S3 File Uploader", layout)

while True:
    event, values = window.read()
    if event == sg.WINDOW_CLOSED or event == "Cancel":
        break
    elif event == "-SEARCH_BUCKET-":
        access_key_id = values["-ACCESS_KEY_ID-"]
        secret_access_key = values["-SECRET_ACCESS_KEY-"]
        bucket_list = get_bucket_list(access_key_id, secret_access_key)
        window["-BUCKET_LIST-"].update(values=bucket_list)
    elif event == "-BUCKET_LIST-":
        selected_bucket = values["-BUCKET_LIST-"][0]
        window["-OBJECT_NAME-"].update(selected_bucket)
    elif event == "-BROWSE-":
        file_path = sg.popup_get_file("Select a file", no_window=True)
        if file_path:
            window["-FILE_PATH-"].update(file_path)
            window["-OBJECT_NAME-"].update(os.path.basename(file_path))
    elif event == "Upload":
        file_path = values["-FILE_PATH-"]
        bucket_name = values["-BUCKET_LIST-"][0]
        object_name = values["-OBJECT_NAME-"]
        access_key_id = values["-ACCESS_KEY_ID-"]
        secret_access_key = values["-SECRET_ACCESS_KEY-"]
        # Replace with your implementation for file upload to S3
        print(f"Uploading {file_path} to bucket {bucket_name} with object name {object_name}...")
        # upload_file_to_s3(file_path, bucket_name, object_name, access_key_id, secret_access_key)

# Close the window
window.close()
