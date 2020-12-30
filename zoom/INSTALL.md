* Draft: 2020-12-22 (Tue)

# How to Install Zoom



## Ubuntu Linux (20.02)

Step 1. Download the installation file

```bash
$ wget https://zoom.us/client/latest/zoom_amd64.deb
```

Step 2. Install Zoom by running the installation file.

```bash
$ sudo apt install ./zoom_amd64.deb
```

If an error occurs, replace the above command to the following one.

```bash
$ sudo apt --fix-broken install ./zoom_amd64.deb
```

Step 3. Verify the installation by , run:

```bash
$ zoom &
```

