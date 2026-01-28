# CLAUDE.md - AI Assistant Guidelines

> This document provides context and conventions for AI assistants working with this repository.

## Project Overview

**Repository:** KU-kelompok
**Status:** New repository - awaiting initial project setup
**Last Updated:** 2026-01-28

### Purpose
<!-- TODO: Update with project description once established -->
This repository is set up for collaborative development. The specific project purpose will be documented here once the initial codebase is established.

---

## Repository Structure

```
KU-kelompok/
├── CLAUDE.md           # AI assistant guidelines (this file)
└── (awaiting project initialization)
```

<!-- TODO: Update directory structure as the project develops -->

---

## Development Workflow

### Branch Naming Convention
- Feature branches: `feature/<description>`
- Bug fixes: `fix/<description>`
- Documentation: `docs/<description>`
- AI-assisted work: `claude/<session-id>`

### Commit Message Format
Follow conventional commits:
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Pull Request Guidelines
1. Create a descriptive PR title
2. Include a summary of changes
3. Reference related issues (if any)
4. Ensure all tests pass before merging

---

## Code Conventions

<!-- TODO: Update with specific conventions once tech stack is chosen -->

### General Principles
- Write clean, readable, and maintainable code
- Follow DRY (Don't Repeat Yourself) principle
- Keep functions small and focused
- Use meaningful variable and function names
- Add comments only where the logic isn't self-evident

### File Organization
- Group related files together
- Use consistent naming conventions
- Keep configuration files in the root or dedicated config directory

---

## AI Assistant Guidelines

### When Working on This Repository

1. **Read Before Modifying**
   - Always read existing files before making changes
   - Understand the context and purpose of code before editing

2. **Minimal Changes**
   - Make only the changes that are directly requested
   - Avoid over-engineering or adding unrequested features
   - Don't add unnecessary comments, docstrings, or type annotations

3. **Security First**
   - Never introduce security vulnerabilities
   - Be mindful of OWASP top 10 vulnerabilities
   - Don't hardcode secrets or credentials

4. **Testing**
   - Run existing tests before and after making changes
   - Add tests for new functionality when appropriate

5. **Git Operations**
   - Use descriptive commit messages
   - Push to the designated feature branch
   - Never force push without explicit permission

### Commands Reference

<!-- TODO: Update with actual project commands once established -->

```bash
# Common development commands will be listed here
# Example:
# npm install        # Install dependencies
# npm run dev        # Start development server
# npm run test       # Run tests
# npm run build      # Build for production
```

---

## Environment Setup

<!-- TODO: Update with setup instructions once project is initialized -->

### Prerequisites
- Git installed and configured
- (Additional requirements to be documented)

### Getting Started
1. Clone the repository
2. (Setup steps to be documented)

---

## Key Files Reference

| File | Purpose |
|------|---------|
| `CLAUDE.md` | AI assistant guidelines and project overview |
| <!-- Add more files as project develops --> | |

---

## Notes for AI Assistants

### Important Reminders
- This is a collaborative project repository
- Always verify the current branch before making changes
- Check git status frequently to track changes
- When in doubt, ask for clarification rather than assuming

### Context Retention
- The repository name "KU-kelompok" suggests a group/team project
- Keep track of evolving project requirements as they are documented
- Update this CLAUDE.md file when significant changes occur

---

## Changelog

### 2026-01-28
- Initial CLAUDE.md created for new repository
- Established baseline conventions and guidelines
- Repository awaiting initial project content

---

*This document should be updated as the project evolves. AI assistants should refer to this file at the start of each session to understand the current state and conventions of the repository.*
