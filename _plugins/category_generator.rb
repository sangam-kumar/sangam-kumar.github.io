module Jekyll
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      # Get all unique categories from posts
      categories = site.posts.docs.map { |post| post.data['categories'] }.flatten.compact.uniq
      
      categories.each do |category|
        # Use Jekyll's slugify filter logic: lowercase, replace spaces with dashes
        category_slug = category.to_s.downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
        
        # Create a new page for this category
        site.pages << CategoryPage.new(site, site.source, category, category_slug)
      end
    end
  end

  class CategoryPage < Page
    def initialize(site, base, category, slug)
      @site = site
      @base = base
      @dir  = 'categories'
      @name = "#{slug}.html"
      
      self.process(@name)
      
      # Initialize data hash with layout, category_name, and permalink
      self.data = {
        'layout' => 'default',
        'category_name' => category,
        'permalink' => "/categories/#{slug}/"
      }
      
      # Use the category template content
      self.content = <<~CONTENT
        <div class="category-page">
          <h1>{{ page.category_name }} Posts</h1>
          <div class="posts-list">
            {% assign category_posts = site.posts | where_exp: "post", "post.categories contains page.category_name" %}
            {% if category_posts.size > 0 %}
              {% for post in category_posts %}
              <article class="post-preview">
                <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
                <div class="post-meta">
                  <time datetime="{{ post.date | date: '%Y-%m-%d' }}">{{ post.date | date: "%B %d, %Y" }}</time>
                  {% if post.tags.size > 0 %}
                  <span class="tags">
                    {% for tag in post.tags %}
                    <span class="tag">{{ tag }}</span>
                    {% endfor %}
                  </span>
                  {% endif %}
                </div>
                {% if post.excerpt %}
                <p class="excerpt">{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
                {% endif %}
              </article>
              {% endfor %}
            {% else %}
              <p>No posts found in this category.</p>
            {% endif %}
          </div>
        </div>
      CONTENT
    end
  end
end

