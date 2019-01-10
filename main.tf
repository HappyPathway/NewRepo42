//--------------------------------------------------------------------
// Variables
variable "network_host_instance_type" {}
variable "network_host_network_ws" {}
variable "network_host_organization" {}
variable "network_host_private_instances" {}
variable "network_host_public_instances" {}
variable "network_host_public_service_port" {}
variable "network_host_resource_tags" {}
variable "network_host_service_cidr" {}
variable "network_host_ssh_cidr" {}
variable "network_host_user_data" {}
variable "network_availability_zones" {}
variable "network_key_name" {}
variable "network_network_name" {}
variable "network_private_subnet_cidrs" {}
variable "network_public_subnet_cidrs" {}
variable "network_region" {}
variable "network_vpc_cidr" {}

//--------------------------------------------------------------------
// Modules
module "network_host" {
  source  = "app.terraform.io/AWSDemoDarnoldTFE/network-host/aws"
  version = "2.2.0"

  instance_type = "${var.network_host_instance_type}"
  network_ws = "${var.network_host_network_ws}"
  organization = "${var.network_host_organization}"
  private_instances = "${var.network_host_private_instances}"
  public_instances = "${var.network_host_public_instances}"
  public_service_port = "${var.network_host_public_service_port}"
  resource_tags = "${var.network_host_resource_tags}"
  service_cidr = "${var.network_host_service_cidr}"
  ssh_cidr = "${var.network_host_ssh_cidr}"
  user_data = "${var.network_host_user_data}"
}

module "network" {
  source  = "app.terraform.io/AWSDemoDarnoldTFE/network/aws"
  version = "3.1.0"

  availability_zones = "${var.network_availability_zones}"
  key_name = "${var.network_key_name}"
  network_name = "${var.network_network_name}"
  private_subnet_cidrs = "${var.network_private_subnet_cidrs}"
  public_subnet_cidrs = "${var.network_public_subnet_cidrs}"
  region = "${var.network_region}"
  vpc_cidr = "${var.network_vpc_cidr}"
}
