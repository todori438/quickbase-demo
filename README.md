# quickbase-demo

# prereqs

setup aws account and configure credentials or assume role
make sure terraform is installed

# clone repo to get the terraform files
git clone https://github.com/todori438/quickbase-demo.git

# cd into the repo and enter terraform-ec2-module
terraform init <br />
terraform plan <br />
terraform apply <br />

this will deploy ec2 instance and will execute userdata to deploy docker and to run a simple docker app. the app could be found in this repo, but /app folder

once ec2 instance is provisioned, you can access the app using the public dns/ip on port 5001, i.e: http://ec2-3-88-70-95.compute-1.amazonaws.com:5001/
