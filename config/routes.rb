Rails.application.routes.draw do

  
  get 'conflict_checker/index'
  post 'conflict_checker/index' => 'conflict_checker#create'
  get 'pref_summary/index'
  get 'conflict_suggestion/index'
  get "addfaculty" => 'home_page#addfaculty'
  get "addcourse" => 'home_page#addcourse'
  get "addsemester" => 'home_page#addsemester'
  get "createsemester" => 'home_page#createsemester'
  get "setsession" => 'home_page#setsession'

  root 'home_page#home'
  resources :faculty_preferences, :except => [:show]
  get 'faculty_preferences/update_time_slots', :as => 'update_time_slots'
  get 'faculty_preferences/:id/display_summary' => 'faculty_preferences#display_summary', :as => 'display_summary'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :conflict_checker
  resources :class, :except => [:show]
   get 'class/update_room', as: 'update_room'
   get 'class/update_capacity', as: 'update_capacity'
   get 'class/update_timeslot', as: 'update_timeslot'
   
    # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  resources :faculty_courses
  resources :course_assignments, :except => [:show,:edit,:update]
  get 'course_assignments/update_faculty_details', as: 'update_faculty_details'
  get 'course_assignments/update_day_combination', as: 'update_day_combination'
  get 'course_assignments/update_room', as: 'update_available_room'
  get 'course_assignments/update_time_slot', as: 'update_time_slot'
  put 'course_assignments/update_course_assignment', as: 'update_course_assignment'
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end
  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  post 'select_faculty' => 'faculty_courses#select_faculty'
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
