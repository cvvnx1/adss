# adss v1.6.2

Summary:
  recoding from old adss puppet module, more flex and strong...

Usage:
  put all file in puppet configuration folder and declare you node in ./manifests/
  Read ./manifests/sample.pp first. It's a sample for node declare

# baseconf
Base variable for adss system
# mysql (with replication role)
compile and install mysqld server
# httpd (with vhost & ajp proxy)
compile and install apache httpd server
