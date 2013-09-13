default['source_mirror']['data_dir'] = 'fort'
default['source_mirror']['data_dir'] = '/data/source'

default['source_mirror']['apache']['listen_hostname'] = '*'
default['source_mirror']['apache']['listen_port'] = '80'

override['apache']['default_site_enabled'] = false

default['source_mirror']['repos'] = {
  'andymccurdy' => 'redis-py',
  'bfirsh' => 'django-tagging',
  'bradleywright' => 'django-static-management',
  'cliffmoon' => 'dynomite',
  'devfort' => '*',
  'django' => 'django',
  'elasticsearch' => 'elasticsearch',
  'ericflo' => 'django-pagination',
  'garethr' => [
    'django-clue',
    'django-http-debug',
    'django-project-templates',
    'django-test-extensions',
  ],
  'jaylett' => [
    'django_audited_model',
    'django_auto_sluggable',
    'django_concurrent_test_server',
    'django_exceptional_middleware',
    'django_session_stashable',
  ],
  'jquery' => 'jquery',
  'paulmakepeace' => 'refine-client-py',
  'rboulton' => [
    'restpose',
    'restpose-py',
  ],
  'sebleier' => 'django-redis-cache',
  'simonw' => [
    'bugle_project',
    'django-debug-toolbar',
    'django-openid',
  ],
  'xapian' => 'xapian',
}
