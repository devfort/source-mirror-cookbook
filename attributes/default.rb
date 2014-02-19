default['source_mirror']['user'] = 'fort'
default['source_mirror']['data_dir'] = '/data/source'

default['source_mirror']['apache']['listen_hostname'] = 'source.fort'
default['source_mirror']['apache']['listen_port'] = '80'

default['source_mirror']['repos'] = {
  'andymccurdy' => 'redis-py',
  'artfinder' => 'jquery-equal-height',
  'bfirsh' => 'django-tagging',
  'bradleywright' => 'django-static-management',
  'cliffmoon' => 'dynomite',
  'django' => 'django',
  'dlanger' => 'inlinestyler',
  'elasticsearch' => 'elasticsearch',
  'ericflo' => 'django-pagination',
  'garethr' => [
    'django-clue',
    'django-http-debug',
    'django-project-templates',
    'django-test-extensions',
  ],
  'jacobian' => [
     'djangobook.com',
     'django-shorturls',
  ],
  'jaylett' => [
    'django_audited_model',
    'django_auto_sluggable',
    'django_concurrent_test_server',
    'django_exceptional_middleware',
    'django_session_stashable',
    'django-moreviews',
    'django-render-as',
    'django-jcache',
    'django-ballads',
    'newspan2',
    'xapian-docsprint',
  ],
  'jquery' => [
    'jquery',
    'sizzle',
    'jquery-mobile',
    'jquery-ui',
    'api.jquery.com',
    'api.jquerymobile.com',
    'api.jqueryui.com',
  ],
  'LearnBoost' => 'juice',
  'mirrors' => [
    'WebKit',
  ],
  'OpenRefine' => 'OpenRefine',
  'PaulMakepeace' => 'refine-client-py',
  'restpose' => '*',
  'sebleier' => 'django-redis-cache',
  'simonw' => [
    'django-debug-toolbar',
    'django-openid',
  ],
  'xapian' => 'xapian',
  'devfort' => '*',
  'spacelog' => '*',
  'historymesh' => '*',
  
  # Cookbooks
  'poise' => 'python',
  'opscode-cookbooks' => '*',
}
