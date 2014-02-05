class puppet {
    include puppet::param, puppet::preinstall, puppet::install, puppet::config, puppet::service
}
