require 'pdf/reader'

describe 'Nowidow PDF' do
  reader = PDF::Reader.new('nowidow.pdf')
  it 'should have 8 pages' do
    reader.page_count.should eq(4)
  end
  it 'should be made by TeX' do
    reader.info[:Creator].should eq('TeX')
  end
  it 'should have page 1 with given media box' do
    reader.pages[0].attributes[:MediaBox].should eq([0, 0, 595.276, 841.89])
  end
  it 'should have 4 fonts on page 2' do
    reader.pages[1].fonts.keys.size.should eq(4)
  end
  it 'should start with a title' do
    reader.pages[0].text.should match('Thenowidowpackage.*')
  end
end

describe 'Nowidow-test PDF' do
  reader = PDF::Reader.new('nowidow-test.pdf')
  it 'should have 8 pages' do
    reader.page_count.should eq(16)
  end
  it 'should be made by TeX' do
    reader.info[:Creator].should eq('TeX')
  end
  it 'should have page 1 with given media box' do
    reader.pages[0].attributes[:MediaBox].should eq([0, 0, 595.276, 841.89])
  end
  it 'should have 3 fonts on page 2' do
    reader.pages[1].fonts.keys.size.should eq(3)
  end
  it 'should start with a level 0 heading' do
    reader.pages[0].text.should match('1Headingonlevel0\(chapter\).*')
  end
end
