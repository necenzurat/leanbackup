<!-- psych -->


[![.restback](https://i.imgur.com/COdScUo.png)](#)

# `$ ./leanbackup` - WIP

> Make backups ~~great~~ easy again.

## About

📦  leanback provides a simple way to backup stuff.
It uses restic and has an installer for generating backup policies.
And it's all written in good ol' bash.

## Usage

1. Run the installer
2. Forget about it


## Repo structure

All repoos are located into the backups folder, examples are located in the templates folder.

```
.
└── repo-name
    ├── .env (secrets file)
    ├── backup
    │   ├── db-backup.sh (how backups are done)
    │   └── files-backup.sh (how db backups are done)
    ├── cleanup
    │   └── cleanup.sh (how the clenup is done)
    └── sync
        └── sync.sh (hot the syncing is done)
```
and that's about it.

You can add as many .sh file as you see fit, they are loaded automagically.

## 👔 License

[License](license.md)

## Credits
Image: https://unsplash.com/photos/Im7lZjxeLhg
