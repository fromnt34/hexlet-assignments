require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens bulletins page' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'bulletins page has links to bulletins' do
    # TODO: написать функцию, которая будет по фикстурам создавать записи в БД
    Bulletin.create title: 'Title 1', body: 'Body 1'
    Bulletin.create title: 'Title 2', body: 'Body 2'

    get bulletins_url

    assert_select 'a', 'Title 1'
    assert_select 'a', 'Title 2'
  end

  test 'opens one bulletin page' do
    bulletin = bulletins :bulletin_1
  
    get bulletin_url bulletin
  
    assert_response :success
    assert_select 'h1', 'Bulletin page'
  end

  test 'one bulletin page has correct title and body' do
    bulletin = bulletins :bulletin_1

    get bulletin_url bulletin

    assert_select 'p', 'Title 1'
    assert_select 'p', 'Body 1'
  end
end
