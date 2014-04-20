import services.lib.backuputils as backuputils

def resource_filename(*args):
    return backuputils.addon_dir() + "/services/lib/dropbox/trusted-certs.crt"
