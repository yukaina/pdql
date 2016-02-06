require 'spec_helper'

describe 'Dam' do
  let(:area_doc) { Nokogiri::HTML(File.open('spec/html/area/hokkaido.html', 'r+:shift_jis', &:read)) }
  let(:area) { Pdql::Area.new(area_doc, 'http://www.example.jp/nrpc0702gDisp.do?areaCode=81') }

  context do
    subject { area.dams }
    it { expect(subject.count).to eq(34) }
  end

  context 'when 十勝ダム' do
    subject { area.dams.first }
    it { expect(subject.observatory_sign_cd).to eq('1368010829060') }
    it { expect(subject.history_link?).to eq(true) }
    it { expect(subject.name).to eq('十勝ダム') }
    it { expect(subject.admin_type).to eq('国河川') }
    it { expect(subject.uri).to eq(URI.parse('http://www1.example.jp/cgi/SiteInfo.exe?ID=1368010829060&KAWABOU=YES')) }
    it { expect(subject.area_cd).to eq('81') }
  end

  context 'when 小平ダム' do
    subject { area.dams.last }
    it { expect(subject.observatory_sign_cd).to be_nil }
    it { expect(subject.history_link?).to eq(false) }
    it { expect(subject.name).to eq('小平ダム') }
    it { expect(subject.admin_type).to eq('自治体') }
    it { expect(subject.uri).to be_nil }
    it { expect(subject.area_cd).to eq('81') }
  end
end
