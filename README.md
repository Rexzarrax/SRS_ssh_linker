# SRS_ssh_linker

Simple tool to login to Swinburne Universities Cisco labs using Bash on Unix based Operating Systems

## Dependencies

1. SSHpass
1. Python 3.X
1. Locate


## Usage

1. Navigate to your rooms smart Rack (eg. Smart Rack 1 has the URL: https://ictencsvr1.ict.swin.edu.au/ )
2. Login and book a kit as per usual
3. copy the link given in the "native console" option 
4. use the following syntax: 
   ```bash ./srsh.sh "copied_ssh_url_in_quotes" ```
