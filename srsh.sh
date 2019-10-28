#!/bin/bash -e
#ssh://port31%3Bpassword%3DfDjg9BjZne@ictencsvr1.ict.swin.edu.au/

#REQUIREMENTS:
#Python 3.x
#sshpass

function call_python
{
python - << END
import sys

def url_host(str_input):

    int_arg_num = 1
    str_uname = str_input.lstrip("ssh://")
    str_uname = str_uname.split(";")[0]
    str_uname = str_uname.split("3B")[0]
    str_uname = str_uname.replace("%","")
    str_password = str_input.split("%3Bpassword%3D")[1]
    str_password = str_password.split("@")[0]
    str_server = str_input.split("@")[1].strip("/")
    str_locale = str_uname+"@"+str_server

    str_print = str_uname+"@"+str_server
    str_result = str_print+","+str_password
    return str_result

if __name__ == "__main__":
    print(url_host("$1"))
END
}

echo "URL Collected"
str_url_pass=$(call_python "$1") || (clear && echo " " && echo "Please Give a ssh URL as first argument encapsulated with quotes" && exit 1);

IFS=', ' read -ra arr_result_bash <<<$str_url_pass; 

echo "Host = "${arr_result_bash[0]};
echo "Password = "${arr_result_bash[1]};

sshpass -p ${arr_result_bash[1]} ssh -o StrictHostKeyChecking=no ${arr_result_bash[0]}

read emp
