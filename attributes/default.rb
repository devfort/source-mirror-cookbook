default['source_mirror']['user'] = 'fort'
default['source_mirror']['data_dir'] = '/data/source'

default['source_mirror']['apache']['listen_hostname'] = 'source.fort'
default['source_mirror']['apache']['listen_port'] = '80'

default['source_mirror']['repos'] = {
  'andymccurdy' => 'redis-py',
  'bfirsh' => [
    'django-shorturls',
    'django-tagging',
  ],
  'bradleywright' => 'django-static-management',
  'cliffmoon' => 'dynomite',
  'dariusk' => 'corpora',
  'django' => 'django',
  'dlanger' => 'inlinestyler',
  'elasticsearch' => 'elasticsearch',
  'ericflo' => 'django-pagination',
  'firebug' => 'firebug',
  'garethr' => [
    'django-clue',
    'django-http-debug',
    'django-project-templates',
    'django-test-extensions',
  ],
  'jacobian-archive' => [
     'djangobook.com',
  ],
  'jaylett' => [
    'django-override-db-tables',
    'django-logentry-admin',
    'django_audited_model',
    'django_auto_sluggable',
    'django_exceptional_middleware',
    'django_session_stashable',
    'django-moreviews',
    'django-render-as',
    'django-jcache',
    'django-ballads',
    'django-database-constraints',
    'jquery-equal-height',
    'searchify',
    'newspan2',
    'xapian-docsprint',
    'heroku-statsd-example',
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
  'liuliu' => 'ccv',
  'mirrors' => [
    'WebKit',
  ],
  'mintchaos' => 'typogrify',
  'mitsuhiko' => 'jsonjinja',
  'OpenRefine' => 'OpenRefine',
  'PaulMakepeace' => 'refine-client-py',
  'sebleier' => 'django-redis-cache',
  'simonw' => [
    'django-debug-toolbar',
    'django-openid',
  ],
  'restpose' => '*',
  'vlfeat' => '*',
  'xapian' => '*',
  'devfort' => '*',
  'historymesh' => '*',
  'spacelog' => '*',

  # Cookbooks
  'poise' => 'python',
  'opscode-cookbooks' => '*',
}
