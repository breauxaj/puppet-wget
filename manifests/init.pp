class wget (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'wget',
  }

  package { $required: ensure => $ensure }

}
