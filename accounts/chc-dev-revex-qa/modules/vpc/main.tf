provider "aws" {
  region = "us-east-1"

  ## requister credentials.
}

## Requester's side of the connection.
resource "aws_vpc_peering_connection" "requesting_peer" {
  vpc_id        = var.requester_vpc_id
  peer_vpc_id   = var.accepter_vpc_id
  peer_owner_id = var.owner_id
  peer_region   = var.peer_region
  auto_accept   = false

  tags = {
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "accepting_peer" {
  vpc_peering_connection_id = aws_vpc_peering_connection.requesting_peer.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}

#### Add route table entry Requester side.
data "aws_route_table" "requester_rt_entry" {
  subnet_id = var.requester_subnetid
}

resource "aws_route" "requester_route" {
  route_table_id            = data.aws_route_table.requester_rt_entry.id
  destination_cidr_block    = "10.224.96.0/20"
  vpc_peering_connection_id = aws_vpc_peering_connection.requesting_peer.id
}

## Add route table entry accepter side.
data "aws_route_table" "accepter_rt_entry" {
  provider = aws
  subnet_id = var.accepter_subnetid
}

resource "aws_route" "accepter_route" {
  provider = aws
  route_table_id            = data.aws_route_table.accepter_rt_entry.id
  destination_cidr_block    = "10.46.16.0/20"
  vpc_peering_connection_id = aws_vpc_peering_connection.requesting_peer.id
}
