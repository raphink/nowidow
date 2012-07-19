require 'pdf/reader'

describe 'Nowidow PDF' do
  reader = PDF::Reader.new('nowidow.pdf')
  it 'should have 8 pages' do
    reader.page_count.should eq(4)
  end
  it 'should be made by TeX' do
    reader.info[:Creator].should eq('TeX')
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
  it 'should have 3 pages' do
    reader.page_count.should eq(3)
  end
  it 'should be made by TeX' do
    reader.info[:Creator].should eq('TeX')
  end
  it 'should have page 1 with given media box' do
    reader.pages[0].attributes[:MediaBox].should eq([0, 0, 297.638, 419.528])
  end
  it 'should have 1 font on page 2' do
    reader.pages[1].fonts.keys.size.should eq(1)
  end
  it 'should contain 4 lines on page 3' do
    reader.pages[2].text.should eq("augue.Crasacmagna.Crasnulla.Nulla\negestas.Curabituraleo.Quisqueegestas\nwisiegetnunc.Namfeugiatlacusvelest.\nCurabiturconsectetuer.\n3")
  end
end
