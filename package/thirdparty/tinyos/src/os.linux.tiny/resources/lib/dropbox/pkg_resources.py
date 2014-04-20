import resources.lib.utils2 as utils

def resource_filename(*args):
    return utils.addon_dir() + "/resources/lib/dropbox/trusted-certs.crt"
