schema '0001 initial' do
  entity 'Post' do
    boolean :complete, default: false
    boolean :active, default: false

    string :title, optional: false
    string :body
  end
end
