# Daily Writing Guide

Welcome to your daily writing setup! This guide will help you build a consistent writing routine.

## 🎯 Philosophy

The goal is to write **something** every day, even if it's small. Daily writing helps:
- Build a habit
- Capture ideas before they're forgotten
- Improve your writing skills over time
- Create a record of your learning journey
- Process your thoughts and experiences

## 🚀 Quick Start

### Creating a New Daily Post

Use the PowerShell script to create a new post:

```powershell
# From the project root
.\scripts\new-post.ps1
```

Or with a custom title:

```powershell
.\scripts\new-post.ps1 "Learning TypeScript"
```

The script will:
- Create a new markdown file in `_posts/` with today's date
- Use a template that prompts you with helpful sections
- Open the file for you to start writing

### Manual Creation

If you prefer, you can manually create posts:

1. Create a file in `_posts/` with format: `YYYY-MM-DD-title.md`
2. Copy the template from `_templates/post-template.md`
3. Fill in the date and start writing!

## 📝 Writing Templates

The default template includes these sections:

- **What I Learned Today** - Capture new knowledge
- **What I'm Working On** - Document current projects
- **Thoughts & Reflections** - Process your day
- **Tomorrow's Focus** - Plan ahead

Feel free to modify these or create your own templates for different types of posts!

## 💡 Daily Writing Tips

### 1. **Start Small**
- Don't feel pressured to write a lot
- Even 2-3 sentences is better than nothing
- Quality matters more than quantity

### 2. **Find Your Time**
- Pick a consistent time (morning coffee, evening reflection)
- Set a reminder if needed
- Make it part of your routine

### 3. **Write What Matters to You**
- What did you learn?
- What problem did you solve?
- What challenge did you face?
- What made you curious?

### 4. **Don't Overthink It**
- It's okay if it's not perfect
- You can always revise later
- The act of writing is what matters

### 5. **Use Categories and Tags**
- Categories: `daily`, `coding`, `reading`, `projects`, `general`
- Tags: Add relevant keywords for searchability

## 📊 Tracking Your Writing

### Check Your Progress

```powershell
# Count posts in the last month
Get-ChildItem _posts\*.md | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-30) } | Measure-Object | Select-Object -ExpandProperty Count
```

### View Recent Posts

```powershell
# List recent posts
Get-ChildItem _posts\*.md | Sort-Object LastWriteTime -Descending | Select-Object -First 10 Name, LastWriteTime
```

## 🎨 Customizing Your Setup

### Custom Templates

Create different templates for different types of posts:

- `_templates/daily-template.md` - Daily entries
- `_templates/project-template.md` - Project updates
- `_templates/learning-template.md` - Learning notes
- `_templates/review-template.md` - Book/course reviews

Then modify the script to use different templates:

```powershell
.\scripts\new-post.ps1 -Template "project"
```

### Blog Categories

Your blog supports categories. Common ones:
- `daily` - Daily writing entries
- `coding` - Programming topics
- `reading` - Book reviews, article summaries
- `projects` - Project updates and showcases
- `general` - General thoughts and updates

## 🔄 Building the Habit

### Week 1: Foundation
- Write every day, even just one sentence
- Focus on consistency, not perfection
- Use the template to guide you

### Week 2-4: Refinement
- Experiment with different sections
- Try different writing times
- Find what works for you

### Month 2+: Customization
- Develop your own style
- Create custom templates
- Share more polished posts publicly

## 📚 Examples of Daily Writing

### Short Entry (2 minutes)
```markdown
## What I Learned Today
Learned about Jekyll plugins and how to customize the build process.

## Tomorrow's Focus
Finish the blog setup and write my first real post.
```

### Medium Entry (5-10 minutes)
```markdown
## What I Learned Today
Spent time understanding how Jekyll's front matter works. The date format 
matters for post ordering, and categories can be hierarchical.

## What I'm Working On
Setting up this daily writing routine. It's important to make the barrier 
to entry low so I actually do it consistently.

## Thoughts & Reflections
I often overthink what to write. I need to remember that daily writing is 
about capturing thoughts, not creating perfect content.
```

### Longer Entry (15+ minutes)
When you have more to say or want to develop a topic further.

## 🎯 Success Metrics

Track your progress:
- **Streak**: How many days in a row have you written?
- **Total Posts**: How many posts have you created?
- **Average Length**: Are you comfortable writing more over time?

## 🆘 Troubleshooting

### Script won't run?
- Make sure you're running PowerShell (not Command Prompt)
- You may need to set execution policy: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Can't think of what to write?
- Write about what you learned today (even if small)
- Write about a problem you solved
- Write about something that confused you
- Write about what you want to learn next

### Fell off the habit?
- That's okay! Start again today.
- Don't try to "catch up" - just write today's entry
- Remember: consistency > perfection

## 🎉 Remember

The most important thing is to **start writing**. Don't wait for the perfect idea or the perfect time. Just write something, anything, and build from there.

Happy writing! 📝

