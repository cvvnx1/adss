# httpd

Summary:

  Install httpd app for puppet client

Description:

  Setup include 3 parts:install,config,service

  - Install
    
    prepare and compile target app with parameters in ./manifests/params.pp
    like ${prefix},${data_dir} etc.

  - Config
    config compiled app by ./manifests/config/conf.pp (class template)
    config vhost and by ./manifests/config/vhost.pp & proxy.pp (class template)
    initial system service script for target app by ./manifests/config/initrc.pp (class template)

  - Service
    make target app start in system by ./manifests/service/control.pp