#!/bin/bash
exec serf agent -tag role=xweb -tag http_vhost=$HTTP_VHOST