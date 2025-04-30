# ActiveAdmin Hotwire Combobox Filters

This gem adds a hotwire combobox to ActiveAdmin sidebar filters for related resources (`belongs_to`, `has_many`, etc.).

# Installation

```ruby
gem "activeadmin-hotwire_combobox_filters"
```

# Usage

The gem automatically replaces the default ActiveAdmin filters with hotwire_combobox filters after being required and configured.

The gem requires ActiveAdmin to be wired up with Hotwire.

Here's an example setup:

1. Add hotwire_combobox styles to your app, I recommend adding them to `app/views/active_admin/_html_head.html.erb`:

   ```erb
   <%= render "activeadmin_hotwire_combobox_filters/combobox_styles" %>
   ```

2. Use importmaps:

   In `app/views/active_admin/_html_head.html.erb`:

   ```diff
   -<%= javascript_importmap_tags "active_admin", importmap: ActiveAdmin.importmap %>
   +<%= javascript_importmap_tags %>
   ```

   <details>
   <summary>Here's an example `config/importmap.rb`:</summary>

   ```ruby
   # Pin npm packages by running ./bin/importmap

   pin "application"
   pin "@hotwired/turbo-rails", to: "turbo.min.js"
   pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
   pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
   pin_all_from "app/javascript/controllers", under: "controllers"

   pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.turbo.min.js" # @2.5.2
   pin "@stimulus-components/auto-submit", to: "@stimulus-components--auto-submit.js" # @6.0.0
   pin "@activeadmin/activeadmin", to: "@activeadmin--activeadmin.js" # @4.0.0
   pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.400

   pin "stimulus-datepicker" # @1.0.9
   pin "flowbite-datepicker" # @1.3.1
   ```

   Most of these files are in `vendor/javascript`, added by running `bin/importmap pin @stimulus-components/auto-submit` or similar.

   `turbo.min.js`and`stimulus-loading.js`are part of`turbo-rails` gem (I believe).

   Flowbite is loaded as recommened by Flowbite docs for Rails/importmaps: https://flowbite.com/docs/getting-started/rails/

   </details>

3. Add this line to your `config/application.rb`:

   ```ruby
   config.importmap.paths << ActiveAdmin::Engine.root.join("config", "importmap.rb")
   ```

4. Update your `app/javascript/application.js`:

   ```js
   // Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

   import "active_admin";
   import "@hotwired/turbo-rails";
   import "controllers";
   ```

5. Some additional styling you might want to add to your app:

   ```css
   /* makes it look like other AA input fields */
   :root:root {
     --hw-component-bg-color: rgb(249 250 251);
   }

   /* makes it look like other AA input fields with validation errors */
   .formtastic .error :where(.hw-combobox__main__wrapper) {
     @apply border-red-500;
   }

   /* makes it wider than default hotwire_combobox styles */
   :root:root {
     --hw-combobox-width: 100%;
   }
   .hw-combobox.hw-combobox {
     @apply flex;
   }
   ```

# Thanks and credits

Thanks to [@josefarias](https://github.com/josefarias) for the awesome [hotwire_combobox](https://github.com/josefarias/hotwire_combobox) gem.
Thanks to all the team at [ActiveAdmin](https://github.com/activeadmin/activeadmin) for the awesome gem.
