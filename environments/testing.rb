name "testing"
description "Environment used in testing the upstream cookbooks and reference Chef repository"

override_attributes(
  "mysql" => {
    "server_root_password" => "root",
    "server_debian_password" => "root",
    "server_repl_password" => "root",
    "allow_remote_root" => true,
    "root_network_acl" => "%"
  },
  "openstack" => {
    "auth" => {
      "validate_certs" => false
    },
    "block-storage" => {
      "syslog" => {
        "use" => false
      },
      "api" => {
        "ratelimit" => "False"
      },
      "debug" => true,
      "image_api_chef_role" => "os-image",
      "identity_service_chef_role" => "os-identity",
      "rabbit_server_chef_role" => "os-ops-messaging"
    },
    "compute" => {
      "syslog" => {
        "use" => false
      },
      "libvirt" => {
        "bind_interface" => "eth1",
        "virt_type" => "qemu"
      },
      "novnc_proxy" => {
        "bind_interface" => "eth1"
      },
      "xvpvnc_proxy" => {
        "bind_interface" => "eth1"
      },
      "image_api_chef_role" => "os-image",
      "identity_service_chef_role" => "os-identity",
      "nova_setup_chef_role" => "os-compute-api",
      "rabbit_server_chef_role" => "os-ops-messaging",
      "ratelimit" => {  # Disable ratelimiting so Tempest doesn't have issues.
        "api" => {
          "enabled" => false
        },
        "volume" => {
          "enabled" => false
        }
      },
      "networks" => [
      ],
      "network" => {
         "service_type" => "neutron"
      }
    },
    "db" => {
      "bind_interface" => "eth1",
      "compute" => {
        "host" => "172.16.1.20"
      },
      "identity" => {
        "host" => "172.16.1.20"
      },
      "image" => {
        "host" => "172.16.1.20"
      },
      "network" => {
        "host" => "172.16.1.20"
      },
      "volume" => {
        "host" => "172.16.1.20"
      },
      "dashboard" => {
        "host" => "172.16.1.20"
      },
      "telemetry" => {
        "host" => "172.16.1.20"
      },
      "orchestration" => {
        "host" => "172.16.1.20"
      }
    },
    "developer_mode" => true,
    "endpoints" => {
      "bind-host" => "172.16.1.20",
      "db" => {
        "host" => "172.16.1.20",
        "bind_interface" => "eth1"
      },
      "compute-api" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "8774",
        "path" => "/v2/%(tenant_id)s"
      },
      "compute-xvpvnc" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "6081",
        "path" => "/console"
      },
      "compute-novnc" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "6080",
        "path" => "/vnc_auto.html"
      },
      "image-api" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "9292",
        "path" => "/v2"
      },
      "image-registry" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "9191",
        "path" => "/v2"
      },
      "identity-api" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "5000",
        "path" => "/v2.0"
      },
      "identity-admin" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "35357",
        "path" => "/v2.0"
      },
      "volume-api" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "8776",
        "path" => "/v1/%(tenant_id)s"
      },
      "telemetry-api" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "8777",
        "path" => "/v1"
      },
      "network-api" => {
        "host" => "172.16.1.22",
        "scheme" => "http",
        "port" => "9696",
      },
      "orchestration-api" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "8004",
        "path" => "/v1/%(tenant_id)s"
      },
      "orchestration-api-cfn" => {
        "host" => "172.16.1.20",
        "scheme" => "http",
        "port" => "8000",
        "path" => "/v1"
      },
      "mq" => {
         "host" => "172.16.1.20"
      }
    },
    "identity" => {
      "admin_user" => "admin",
      "admin_token" => "2573abaf91c4af852a53",
      "bind_interface" => "eth1",
      "catalog" => {
        "backend" => "sql"
      },
      "debug" => true,
      "rabbit_server_chef_role" => "os-ops-messaging",
      "roles" => [
        "admin",
        "_member_",
      ],
      "syslog" => {
        "use" => false
      },
      "tenants" => [
        "admin",
        "service",
        "demo"
      ],
      "token" => {
        "backend" => "sql"
      },
      "users" => {
        "admin" => {
          "password" => "admin",
          "default_tenant" => "admin",
          "roles" => { # Each key is the role name, each value is a list of tenants
            "admin" => [
              "admin"
            ],
            "_member_" => [
              "admin"
            ]
          }
        },
        "demo" => {
          "password" => "demo",
          "default_tenant" => "demo",
          "roles" => { # Each key is the role name, each value is a list of tenants
            "_member_" => [
              "demo"
            ]
          }
        }
      }
    },
    "image" => {
      "api" => {
        "bind_interface" => "eth1"
      },
      "debug" => true,
      "identity_service_chef_role" => "os-identity",
      "rabbit_server_chef_role" => "os-ops-messaging",
      "registry" => {
        "bind_interface" => "eth1"
      },
      "syslog" => {
        "use" => false
      },
      "image_upload" => true,
      "upload_image" => {
        "cirros" => "http://cdn.download.cirros-cloud.net/0.3.2/cirros-0.3.2-x86_64-disk.img",
      },
      "upload_images" => [
        "cirros"
      ]
    },
    "network" => {
      "service_plugins" => [],
      "allow_overlapping_ips" => true,
      "ml2" => {
          "type_drivers" => "gre",
          "tenant_network_types" => "gre",
          "tunnel_id_ranges" => "1:1000"
      },
      "l3" => {
          "external_network_bridge_interface" => "eth2"
      },
      "metadata" => {
          "nova_metadata_ip" => "172.16.1.20"
      },
      "openvswitch" => {
          "tenant_network_type" => "gre",
          "tunnel_id_ranges" => "1:1000",
          "tunnel_type" => "gre",
          "enable_tunneling" => true,
      }
    },
    "memcached_servers" => [
      "172.16.1.20:11211"
    ],
    "mq" => {
      "bind_interface" => "eth1",
      "host" => "172.16.1.20",
      "user" => "guest",
      "vhost" => "/nova"
    }
  },
  "queue" => {
    "host" => "172.16.1.20",
    "user" => "guest",
    "vhost" => "/nova"
  }
)
