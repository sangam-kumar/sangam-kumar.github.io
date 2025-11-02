# Personal Blog

A Jekyll-based personal blog for sharing thoughts on Software Engineering, Computer Science, Mathematics, Reading, and Projects.

## 🚀 Deployment to GitHub Pages

This blog is configured to deploy automatically to GitHub Pages using GitHub Actions.

### Prerequisites

- A GitHub account
- Git installed on your local machine

### Deployment Steps

#### Option 1: Deploy as `username.github.io` (User/Organization Site)

1. **Create a new repository on GitHub:**
   - Go to [GitHub](https://github.com/new)
   - Repository name must be: `yourusername.github.io` (e.g., `sangam-kumar.github.io`)
   - Set it as **Public**
   - Click "Create repository"

2. **Initialize Git and push your code:**
   ```powershell
   # Navigate to your project directory
   cd path\to\your\project

   # Initialize git repository (if not already initialized)
   git init

   # Add all files
   git add .

   # Commit the files
   git commit -m "Initial commit: Jekyll blog setup"

   # Add your GitHub repository as remote
   git remote add origin https://github.com/sangam-kumar/sangam-kumar.github.io.git

   # Rename branch to main (if needed)
   git branch -M main

   # Push to GitHub
   git push -u origin main
   ```

3. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click on **Settings** → **Pages**
   - Under **Source**, select **GitHub Actions**
   - Your site will automatically build and deploy!

4. **Access your site:**
   - Your blog will be available at: `https://sangam-kumar.github.io`
   - It may take a few minutes for the first deployment to complete

#### Option 2: Deploy as a Project Site (in a subdirectory)

If you want to deploy to a different repository name:

1. **Create a new repository** (with any name)

2. **Update `_config.yml`:**
   ```yaml
   url: "https://sangam-kumar.github.io"
   baseurl: "/repository-name"  # Change this to your repository name
   ```

3. **Push to GitHub** (same steps as above, but use your repository name)

4. **Enable GitHub Pages:**
   - Go to **Settings** → **Pages**
   - Select **Source**: **GitHub Actions**
   - Your site will be available at: `https://sangam-kumar.github.io/repository-name/`

### Automatic Deployment

This project uses GitHub Actions for automatic deployment. Every time you push to the `main` branch, your site will automatically rebuild and deploy.

### Local Development

To run the blog locally:

```powershell
# Install dependencies
bundle install

# Serve the blog locally
bundle exec jekyll serve

# Visit http://localhost:4000
```

### Updating Your Blog

1. Make changes to your posts in `_posts/` directory
2. Commit and push to GitHub:
   ```powershell
   git add .
   git commit -m "Update blog post"
   git push origin main
   ```
3. GitHub Actions will automatically rebuild and deploy your site

### Custom Domain (Optional)

To use a custom domain:

1. Add a `CNAME` file in your repository root with your domain name
2. Update DNS records as per GitHub Pages instructions
3. Update the `url` in `_config.yml` to your custom domain

## 📁 Project Structure

```
.
├── _config.yml          # Site configuration
├── _includes/           # Reusable HTML components
├── _layouts/            # HTML templates
├── _posts/              # Blog posts (markdown files)
├── _plugins/            # Jekyll plugins
├── _templates/          # Post templates for daily writing
├── assets/              # CSS, JS, and other assets
├── scripts/             # PowerShell scripts for creating posts
├── about.md             # About page
├── blog.html            # Blog listing page
├── index.html           # Homepage
├── WRITING_GUIDE.md     # Daily writing guide and tips
└── Gemfile              # Ruby dependencies
```

## 📝 Daily Writing Setup

This blog is configured for daily writing with an easy-to-use workflow.

### Quick Start: Create a New Post

Use the PowerShell script to create a new daily post:

```powershell
# Create a daily entry with today's date
.\scripts\new-post.ps1

# Or create a post with a custom title
.\scripts\new-post.ps1 "Learning TypeScript Basics"
```

The script will:
- ✅ Create a new post file with today's date
- ✅ Use a template with helpful writing prompts
- ✅ Open the file for you to start writing

### Manual Post Creation

1. Create a new markdown file in `_posts/` directory
2. Name it: `YYYY-MM-DD-post-title.md`
3. Add front matter at the top:
   ```markdown
   ---
   layout: post
   title: "Your Post Title"
   date: 2024-01-15
   categories: [daily]
   tags: [daily-writing]
   ---
   ```

### Daily Writing Guide

See [WRITING_GUIDE.md](WRITING_GUIDE.md) for:
- 📝 Writing tips and templates
- 🎯 Building a consistent writing habit
- 📊 Tracking your progress
- 🎨 Customizing your setup

## 🛠️ Troubleshooting

- **Build fails:** Check GitHub Actions logs in the "Actions" tab of your repository
- **Site not updating:** Wait a few minutes after pushing, or check Actions for errors
- **Local build issues:** Run `bundle update` to update dependencies

## 📚 Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Jekyll Themes](https://jekyllthemes.io/)

