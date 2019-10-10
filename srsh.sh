#!/bin/bash -e

#REQUIREMENTS:
#Python 3.x
#sshpass

function call_python
{
python3 - << END
import sys

def swinhost(str_input):

    int_arg_num = 1
    str_uname = str_input.lstrip("ssh://")[0:6]
    str_password = str_input.lstrip("ssh://"+str_uname+";password=").split("@ictencsvr")[0]
    str_server = str_input.split("@")[1].strip("/")
    str_locale = str_uname+"@"+str_server
    str_print = str_uname+"@"+str_server
    str_result = str_print+","+str_password
    return str_result

if __name__ == "__main__":
    print(swinhost("$1"))
END
}
if (true)
then

str_url_pass=$(call_python "$1");

IFS=', ' read -ra arr_result_bash <<<$str_url_pass; 

echo "Host = "${arr_result_bash[0]};
echo "Password = "${arr_result_bash[1]};

sshpass -p ${arr_result_bash[1]} ssh -o StrictHostKeyChecking=no ${arr_result_bash[0]}

read emp

else

    echo "Please make sure sshpass and python are installed before running this script."

fi
