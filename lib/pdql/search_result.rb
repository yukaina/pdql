module Pdql
  # for 国土交通省　水文水質データベース任意期間 ダム諸量検索結果.dat(csv)データ
  # (http://国土交通省　水文水質データベースURL/dat/dload/download/xxxxxxxxxxxxxxxxxxxxxxxxxxxx.dat)
  class SearchResult
    attr_reader :dam_quantities
    def initialize(page_body)
      dat = page_body.encode('utf-8', 'sjis')
      dam_arr = dat.split(/\n/)
      len = dam_arr.length
      @dam_quantities = []
      # 10行目からデータ。(9行目まではヘッダタイトル等なので無視)
      dam_arr[9, len].each  do |dam|
        @dam_quantities << Pdql::DamQuantity.new(dam)
      end
    end
  end
end
