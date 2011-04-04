require 'test/unit'
require 'myspace'

class TC_AppDatav9 < Test::Unit::TestCase
  include MySpaceTest


def test_getappdata
    @count=1
    objoff=nil
    objon=nil
  [@ms_offsite, @ms_onsite].each do |ms|
      assert_nothing_raised do
        if @count==1
          objoff = ms.get_appdata(USER_ID,'@self',APP_ID,'test')
        else
          objon = ms.get_appdata(USER_ID,'@self',ONSITE_APP_ID,'test')
        end
        @count=2
    end
    end
    assert_instance_of(Hash,objoff)
    
    userDataArray=objoff['entry']
    assert_instance_of(Array,userDataArray)
    userDataItem =userDataArray[0]['userAppData']
    assert_instance_of(Hash,userDataItem)
    appdata=userDataItem['appData']
    assert_instance_of(Array,appdata)
    key=appdata[0]['key']
    assert_instance_of(String,key)
    value=appdata[0]['value']
    assert_instance_of(String,value)
    
    userDataArray=objon['entry']
    assert_instance_of(Array,userDataArray)
    userDataItem =userDataArray[0]['userAppData']
    assert_instance_of(Hash,userDataItem)
    appdata=userDataItem['appData']
    assert_instance_of(Array,appdata)
    key=appdata[0]['key']
    assert_instance_of(String,key)
    value=appdata[0]['value']
    assert_instance_of(String,value)
    
  
end



  def test_addappdata
    @count=1
  [@ms_offsite, @ms_onsite].each do |ms|
      assert_nothing_raised do
        if @count==1
         objoff = ms.add_appdata(USER_ID,APP_ID,'test','testvalue')
        else
         objon = ms.add_appdata(USER_ID,ONSITE_APP_ID,'test','testvalue')
     end
     @count =2
    end
  end
end


end

  
#  [@ms_offsite, @ms_onsite].each do |ms|
#      assert_nothing_raised do
#       # obj = ms.get_appdata_all_Userv9(USER_ID,SELECTOR,APP_ID)
#    end
#  end
#  [@ms_offsite, @ms_onsite].each do |ms|
#      assert_nothing_raised do
#       # obj = ms.get_appdata_singlev9(USER_ID,SELECTOR,APP_ID,'test')
#    end
#  end
#  
#  [@ms_offsite, @ms_onsite].each do |ms|
#      assert_nothing_raised do
#       # obj = ms.delete_appdatav9(USER_ID,SELECTOR,APP_ID,'test')
#    end
#  end
#  
#end
