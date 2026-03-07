---
title: KGC Dev System
layout: page.njk
show_sidebar: true
---

<style>
.book-container {
    max-width: 720px;
    margin: 0 auto;
    padding: 24px 20px 48px;
    font-family: 'Georgia', serif;
    line-height: 1.65;
    color: #333;
}
.book-header {
    text-align: center;
    margin-bottom: 48px;
    padding: 36px 28px;
    background: linear-gradient(135deg, #2d3748, #4a5568);
    color: white;
    border-radius: 12px;
}
.book-title { font-size: 2rem; margin: 0; font-weight: 700; letter-spacing: -0.02em; }
.book-subtitle { font-size: 1.05em; margin-top: 10px; opacity: 0.95; font-weight: 400; }
.book-lead {
    font-size: 1.05rem;
    color: #4a5568;
    line-height: 1.75;
    margin: -8px 0 40px 0;
    padding: 0 8px;
}
.section {
    background: #fafbfc;
    padding: 28px 32px;
    margin: 32px 0;
    border-radius: 10px;
    border-left: 4px solid #4a5568;
    box-shadow: 0 1px 3px rgba(0,0,0,0.04);
}
.section-kicker {
    font-size: 0.7rem;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: #718096;
    margin-bottom: 8px;
}
.section h2 {
    color: #2d3748;
    font-size: 1.35em;
    font-weight: 700;
    margin: 0 0 8px 0;
    border: none;
    padding: 0;
}
.section-intro {
    font-size: 0.95rem;
    color: #4a5568;
    margin-bottom: 20px;
    line-height: 1.6;
}
.pipeline-block {
    background: #edf2f7;
    padding: 22px 24px;
    margin: 20px 0 0;
    border-radius: 8px;
    font-family: 'Consolas', 'Monaco', 'Liberation Mono', monospace;
    font-size: 12.5px;
    line-height: 1.7;
    overflow-x: auto;
    white-space: pre;
    color: #2d3748;
    border: 1px solid #e2e8f0;
}
table { width: 100%; border-collapse: collapse; margin: 16px 0 0; }
th, td { padding: 12px 14px; text-align: left; border-bottom: 1px solid #e2e8f0; }
th { background: #edf2f7; font-weight: 600; color: #2d3748; font-size: 0.9em; }
td { font-size: 0.95rem; }
td:first-child { font-weight: 500; color: #2d3748; }
.section ul { padding-left: 22px; margin: 16px 0 0; }
.section li { margin: 10px 0; font-size: 0.98rem; }
.section li strong { color: #2d3748; }
.checklist-block { margin-top: 16px; }
.checklist-block li { list-style: none; padding-left: 0; margin: 12px 0; padding-left: 26px; position: relative; }
.checklist-block li::before { content: '☐'; position: absolute; left: 0; font-size: 1rem; color: #718096; }
.habit-block {
    background: linear-gradient(135deg, #2d3748, #4a5568);
    color: white;
    padding: 28px 32px;
    border-radius: 10px;
    margin: 40px 0 32px;
    box-shadow: 0 4px 14px rgba(45,55,72,0.2);
}
.habit-block .habit-label {
    font-size: 0.72rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    opacity: 0.9;
    margin-bottom: 12px;
}
.habit-block p { margin: 0; font-size: 1.08em; line-height: 1.65; font-style: italic; }
.habit-block strong { font-style: normal; font-weight: 700; }
.footer-note { text-align: center; font-size: 0.85rem; color: #718096; margin-top: 40px; }
</style>

<div class="book-container">
    <div class="book-header">
        <h1 class="book-title">KGC Dev System</h1>
        <p class="book-subtitle">Error Detection → Fix Pipeline</p>
    </div>
    <p class="book-lead">A single system for building, shipping, and keeping apps healthy. When something breaks in production, you know where to look — and the pipeline from error to fix is already defined.</p>

    <div class="section">
        <div class="section-kicker">Tools</div>
        <h2>The full stack</h2>
        <p class="section-intro">Six tools that cover detection, alerts, tracking, and fixes.</p>
        <table>
            <thead><tr><th>Tool</th><th>Job</th></tr></thead>
            <tbody>
                <tr><td>Sentry</td><td>Detects errors in live apps automatically</td></tr>
                <tr><td>Slack</td><td>Receives alerts from Sentry + Linear</td></tr>
                <tr><td>Linear</td><td>Tracks all bugs and tasks</td></tr>
                <tr><td>Cursor Cloud Agent</td><td>AI that attempts to fix the error</td></tr>
                <tr><td>UptimeRobot</td><td>Monitors if sites are up or down</td></tr>
                <tr><td>Vercel Analytics</td><td>Frontend traffic and usage stats</td></tr>
            </tbody>
        </table>
    </div>

    <div class="section">
        <div class="section-kicker">From error to closed ticket</div>
        <h2>Error pipeline</h2>
        <div class="pipeline-block">1. Error occurs in live app
         ↓
2. Sentry detects it automatically
         ↓
3. Sentry → Slack (Alert #1: what broke + where)
   Sentry → Linear (issue created and logged)
         ↓
4. Linear → Slack (Alert #2: issue confirmed tracked)
         ↓
5. Open Sentry → find the error → read the Root Cause
         ↓
6. Click "Send to Cursor Cloud Agent"
         ↓
7. Cursor Agent analyzes the error and attempts the fix
         ↓
8. Click "Open in Cursor" → review the fix
         ↓
9. Test locally → confirm fix works
         ↓
10. Push to GitHub → auto deploys to Vercel / Railway
         ↓
11. Sentry confirms error stops occurring in production
         ↓
12. Close the Linear issue</div>
    </div>

    <div class="section">
        <div class="section-kicker">From idea to live URL</div>
        <h2>Build + deploy pipeline</h2>
        <div class="pipeline-block">1. ChatGPT        → Research
2. Claude         → Architecture, concepts, brand
3. Cursor         → Full build and debug
4. Local          → Test everything before shipping
5. Gitea          → Local git commit
6. GitHub         → Cloud git push
7. Railway        → Backend auto deploys
   Vercel         → Frontend auto deploys
8. UptimeRobot    → Auto-monitors the new live URL
9. AWS / Supabase → Storage if needed
10. Sentry        → Watching for errors in production</div>
    </div>

    <div class="section">
        <div class="section-kicker">One place per job</div>
        <h2>Platform rules</h2>
        <p class="section-intro">No guessing where things live.</p>
        <table>
            <thead><tr><th>What</th><th>Where</th></tr></thead>
            <tbody>
                <tr><td>Frontend (React, Next.js, static sites)</td><td>Vercel</td></tr>
                <tr><td>Backend (APIs, servers, workers)</td><td>Railway</td></tr>
                <tr><td>Database (PostgreSQL)</td><td>Railway</td></tr>
                <tr><td>File storage</td><td>AWS S3</td></tr>
                <tr><td>Error tracking</td><td>Sentry</td></tr>
                <tr><td>Uptime monitoring</td><td>UptimeRobot</td></tr>
                <tr><td>Bug + task tracking</td><td>Linear</td></tr>
                <tr><td>Team alerts</td><td>Slack</td></tr>
            </tbody>
        </table>
    </div>

    <div class="section">
        <div class="section-kicker">Billing & secrets</div>
        <h2>Account structure</h2>
        <ul>
            <li><strong>Vercel</strong> — One account per billing entity (your projects vs client projects).</li>
            <li><strong>Railway</strong> — One account per billing entity.</li>
            <li><strong>Credentials</strong> — All in Bitwarden; never in plain text.</li>
            <li><strong>Notes</strong> — One Obsidian note per project (see PROJECT-TEMPLATE.md).</li>
        </ul>
    </div>

    <div class="section">
        <div class="section-kicker">Before any demo</div>
        <h2>Pre-demo checklist</h2>
        <ul class="checklist-block">
            <li><strong>Live URL</strong> — Open it; confirm it loads.</li>
            <li><strong>Linear</strong> — Check the backlog; know what’s broken before they see it.</li>
            <li><strong>User flow</strong> — Test the main path end to end.</li>
            <li><strong>UptimeRobot</strong> — No recent downtime.</li>
            <li><strong>Data</strong> — Demo data or test accounts are ready.</li>
        </ul>
    </div>

    <div class="habit-block">
        <div class="habit-label">The one habit that holds it all together</div>
        <p>When you find a bug — open Linear and write one line before you close your laptop. Don’t fix it now. Just log it. <strong>Memory is not a system.</strong></p>
    </div>

    <p class="footer-note">KGC Dev System — March 2026</p>
</div>
