#!/usr/bin/env ruby

# Copyright (c) 2013, Made By Made Ltd
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the "Made By Made Ltd" nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL MADE BY MADE LTD BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require 'rubygems'
require 'AWS'
require 'net/http'
require 'uri'
require 'json'

CONFIG = JSON.parse(IO.read(File.join(File.dirname(__FILE__), 'config.json')))
INSTANCE_HOST = '169.254.169.254'
INSTANCE_ID_URL = '/2012-01-12/meta-data/instance-id'

httpcall = Net::HTTP.new(INSTANCE_HOST)
resp, instance_id = httpcall.get2(INSTANCE_ID_URL)

ec2 = AWS::EC2::Base.new(
  :access_key_id => CONFIG['aws_access_key'],
  :secret_access_key => CONFIG['aws_secret_key'],
  :server => CONFIG['ec2_endpoint']
)

ec2.associate_address(
  :instance_id => instance_id,
  :public_ip => CONFIG['ip_address']
)
