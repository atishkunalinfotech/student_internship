Rails.application.routes.draw do
  
  namespace :admin do
    resources :cities
  end
  namespace :admin do
    root 'dashboard#index'
    resources :companies
    resources :job_groups
    resources :jobs
    resources :students
    resources :educations
    resources :student_work_exps
    resources :internship_statuses
    resources :skill_groups
    resources :skills
    resources :job_posts
    resources :student_job_interests
    resources :reports
    resources :cities
    resources :users
    get 'student_profile' => 'students#student_profile', as: :student_profile
    get 'select_student_profile' => 'student_job_interests#select_student_profile', as: :select_student_profile
    get 'reject_student_profile' => 'student_job_interests#reject_student_profile', as: :reject_student_profile
    get 'student_hire' => 'student_job_interests#student_hire', as: :student_hire
    get 'hire_student' => 'student_job_interests#hire_student', as: :hire_student
    get 'not_hired_student' => 'student_job_interests#not_hired_student', as: :not_hired_student
    get 'student_reports' => 'reports#student_reports', as: :student_reports
    get 'publish_unpublish' => 'jobs#publish_unpublish', as: :publish_unpublish
    get 'company_reports' => 'reports#company_reports', as: :company_reports
    get 'student_internship_statuses' => 'internship_statuses#student_internship_statuses', as: :student_internship_statuses
    get "change_password" => "students#change_password", as: :change_password
    put "update_password" => "students#update_password", as: :update_password
    get "user_change_password" => "users#user_change_password", as: :user_change_password
    put "user_update_password" => "users#user_update_password", as: :user_update_password
  end
  get "change_password" => "students#change_password", as: :change_password
  put "update_password" => "students#update_password", as: :update_password
  devise_for :students
  resources :students
  resources :job_posts
  get "job_interest_post" => 'job_posts#job_interest_post', as: :job_interest_post
  get "job_show" => 'job_posts#job_show', as: :job_show
  devise_for :users
  root 'home#index'
  get 'student_dashboard' => 'student_dashboard#index', as: :student_dashboard
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
