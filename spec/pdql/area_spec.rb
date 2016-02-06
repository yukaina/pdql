require 'spec_helper'

describe 'Area' do
  let(:area_doc) { Nokogiri::HTML(File.open('spec/html/area/hokkaido.html', 'r+:shift_jis', &:read)) }

  context do
    subject do
      Pdql::Area.new(area_doc, 'http://www.example.jp/nrpc0702gDisp.do?areaCode=81')
    end

    it { expect(subject.area_cd).to eq('81') }
    it { expect(subject.dams.count).to eq(34) }
    it { expect(subject.dams.first.class).to eq(Pdql::Dam) }
  end
end
