# Ansible Playground

To run this lab I am assuming you have [vagrant](https://www.vagrantup.com) and [virtualbox](https://www.virtualbox.org) installed.

For obvious reasons, the keys provided under `keys` directory must **never** be used anywhere outside of this lab.

## How to run the lab

There are three scripts in this repository:

- setup.sh
- apply.sh
- test.sh

To prepare the lab you must first run `setup.sh`.  Once the command finishes, you will be logged into the _overlord_ virtual machine.  From here, you should navigate to the `ansible-playground` directory:

```
vagrant@overlord:~$ cd ansible-playground
vagrant@overlord:~$ ./apply.sh
```

To test the HTTP built-in server for Zookeeper are disabled, you can run `test.sh` as follows:

```
vagrant@overlord:~$ ./test.sh
```

