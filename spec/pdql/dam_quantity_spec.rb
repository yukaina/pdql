require 'spec_helper'

describe 'DamQuantity' do
  let(:dam_quantity) { '2016/1/29,21:00,0.0, ,42321, ,1.18, ,71.80, ,55.7,' }

  describe 'initialize' do
    subject { Pdql::DamQuantity.new(dam_quantity) }
    it { expect(subject.observatory_at).to eq('2016/1/29 21:00') }
    it { expect(subject.observatory_on).to eq('2016/1/29') }
    it { expect(subject.observatory_time).to eq('21:00') }
    it { expect(subject.basin_avg_precipitation).to eq('0.0') }
    it { expect(subject.pondage).to eq('42321') }
    it { expect(subject.inflow_quantity).to eq('1.18') }
    it { expect(subject.discharge_quantity).to eq('71.80') }
    it { expect(subject.storing_water_rate).to eq('55.7') }
  end

  describe 'to_h' do
    subject { Pdql::DamQuantity.new(dam_quantity).to_h }
    it { expect(subject[:observatory_at]).to eq('2016/1/29 21:00') }
    it { expect(subject[:observatory_on]).to eq('2016/1/29') }
    it { expect(subject[:observatory_time]).to eq('21:00') }
    it { expect(subject[:basin_avg_precipitation]).to eq('0.0') }
    it { expect(subject[:pondage]).to eq('42321') }
    it { expect(subject[:inflow_quantity]).to eq('1.18') }
    it { expect(subject[:discharge_quantity]).to eq('71.80') }
    it { expect(subject[:storing_water_rate]).to eq('55.7') }
  end
end
