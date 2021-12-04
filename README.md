# Terraform — Create a VPC in Google Cloud
Create a VPC in Google Cloud.

The Terraform script below deploys a server under the [Google Cloud Always Free](https://cloud.google.com/free/) tier,
* terraform__gcloud-instance
	* GitHub: [github.com/k3karthic/terraform__gcloud-instance](https://github.com/k3karthic/terraform__gcloud-instance).
	* Codeberg: [codeberg.org/k3karthic/terraform__gcloud-instance](https://codeberg.org/k3karthic/terraform__gcloud-instance).

## Requirements

Enable the Compute Engine API from [https://console.cloud.google.com/apis/api/compute.googleapis.com/overview?pli=1](https://console.cloud.google.com/apis/api/compute.googleapis.com/overview?pli=1).

## Input Variables

Create a file to store the input variables using the sample file `google.tfvars.sample`. The file should be called `google.tfvars` or edit `bin/plan.sh` with the appropriate file name.

## Deployment

### Step 1

Create a Terraform plan by running plan.sh; the script will read input variables from the file google.tfvars

```
./bin/plan.sh
```

To avoid fetching the latest state of resources, run the following command.

```
./bin/plan.sh --refresh=false
```

### Step 2

Review the generated plan

```
./bin/view.sh
```

### Step 3

Run the verified plan

```
./bin/apply.sh
```

## Encryption

Sensitive files like the input variables (google.tfvars) and Terraform state files are encrypted before being stored in the repository. 

You must add the unencrypted file paths to `.gitignore`.

Use the following command to decrypt the files after cloning the repository,

```
./bin/decrypt.sh
```

Use the following command after running terraform to update the encrypted files,

```
./bin/encrypt.sh <gpg key id>
```
