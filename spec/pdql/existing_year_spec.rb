require 'spec_helper'

describe 'ExistingYear' do
  let(:existing_year_doc) { Nokogiri::HTML(File.open('spec/html/existing_year/tokachi.html', 'r+:EUC-JP', &:read)) }

  context do
    subject { Pdql::ExistingYear.new(existing_year_doc) }

    it { expect(subject.exist_years.count).to eq(15) }
  end

  context do
    subject { Pdql::ExistingYear.new(existing_year_doc).exist_years.first }

    it { expect(subject).to eq(2002) }
  end

  context do
    subject { Pdql::ExistingYear.new(existing_year_doc).exist_years.last }

    it { expect(subject).to eq(2016) }
  end
end
