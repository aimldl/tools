* Rev.2: 2021-07-12 (Mon)

* Rev.1: 2020-12-01 (Tue)
* Draft: 2020-10-16 (Fri)

# How to Install `projectlibre`

## Option 1: Install with Snap

```bash
$ sudo apt update
$ sudo apt install snapd
$ sudo snap install projectlibre
```

Source: [Install ProjectLibre on Ubuntu](https://snapcraft.io/install/projectlibre/ubuntu#install)

## Option 2: Download the installation file 

### Download 

Go to SourceForge [download link](https://sourceforge.net/projects/projectlibre/files/latest/download) on the web browser and the download will start in 5 seconds.

The installation file is a `.deb` file. A few examples of the file name are:

*  `projectlibre_1.9.3-1.deb`
* `projectlibre_1.9.2-1.deb`
* `projectlibre_1.9.1-1.deb`

### Install with the `dpkg` command

Let's say the installation file name is `projectlibre_1.9.1-1.deb`. Run

```bash
$ sudo dpkg -i projectlibre_1.9.1-1.deb
```

and enter the password. Then the `projectlibre` will be installed. The full output message looks like below.

```bash
Selecting previously unselected package projectlibre.
(Reading database ... 222696 files and directories currently installed.)
Preparing to unpack projectlibre_1.9.1-1.deb ...
Unpacking projectlibre (1.9.1-1) ...
Setting up projectlibre (1.9.1-1) ...
Processing triggers for mime-support (3.60ubuntu1) ...
Processing triggers for shared-mime-info (1.9-2) ...
$
```

### Troubleshoot

If the dependencies are broken, you may run the following command the fix the broken dependencies

```bash
$ sudo apt --fix-broken install -y
```

and run the `dpkg` command.

```bash
$ sudo dpkg -i projectlibre_1.9.1-1.deb
```

