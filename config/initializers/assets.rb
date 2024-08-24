# アセットのバージョンを設定
Rails.application.config.assets.version = '1.0'

# Node.js モジュールのパスを追加
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# プリコンパイルするアセットを追加
Rails.application.config.assets.precompile += %w(
  staff.css
  admin.css
  customer.css
)