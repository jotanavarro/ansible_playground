#!/bin/sh

vagrant plugin install virtualbox

vagrant destroy -f; vagrant up

vagrant ssh overlord

