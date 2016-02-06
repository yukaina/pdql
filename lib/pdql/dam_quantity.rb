module Pdql
  # for 国土交通省　水文水質データベース任意期間 ダム諸量検索結果.dat(csv)データのレコード定義
  class DamQuantity
    attr_reader :observatory_at, :observatory_on, :observatory_time, :basin_avg_precipitation,
                :pondage, :inflow_quantity, :discharge_quantity, :storing_water_rate

    def initialize(dam)
      dq = dam.sub(/, \r/, '').split(',')
      @observatory_at          = "#{dq[0]} #{dq[1]}"
      @observatory_on          = dq[0]
      @observatory_time        = dq[1]
      @basin_avg_precipitation = dq[2]
      @pondage                 = dq[4]
      @inflow_quantity         = dq[6]
      @discharge_quantity      = dq[8]
      @storing_water_rate      = dq[10]
    end

    def to_h
      {
        observatory_at:          observatory_at,
        observatory_on:          observatory_on,
        observatory_time:        observatory_time,
        basin_avg_precipitation: basin_avg_precipitation,
        pondage:                 pondage,
        inflow_quantity:         inflow_quantity,
        discharge_quantity:      discharge_quantity,
        storing_water_rate:      storing_water_rate
      }
    end
  end
end
