# Docker Workshop - Data Science Environment

Welcome to the BU Data Science Association Docker Workshop! This workshop demonstrates the power of Docker and Dev Containers for creating reproducible data science environments.

## Workshop Objectives

By the end of this workshop, you'll understand:

- How Docker containers provide consistent, reproducible environments
- The benefits of using Dev Containers for data science projects
- How to set up a complete Python data science stack with Docker
- Best practices for containerized development workflows

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- [Visual Studio Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Basic familiarity with Python and Jupyter notebooks

## Quick Start

### Option 1: Using Dev Containers (Recommended)

1. **Clone this repository:**

   ```bash
   git clone <repository-url>
   cd Docker
   ```

2. **Open in VS Code:**

   ```bash
   code .
   ```

3. **Reopen in Container:**

   - Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
   - Type "Dev Containers: Reopen in Container"
   - Select the command and wait for the container to build

4. **Start exploring:**
   - Open `docker_workshop_demo.ipynb`
   - Run the cells to see Docker in action!

### Option 2: Manual Docker Setup

1. **Build the Docker image:**

   ```bash
   docker build -t docker-workshop .
   ```

2. **Run the container:**

   ```bash
   docker run -it -p 8888:8888 -v $(pwd):/workspace docker-workshop
   ```

3. **Start Jupyter Lab:**
   ```bash
   jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
   ```

## 📁 Workshop Contents

### 🔧 Core Files

- **`docker_workshop_demo.ipynb`** - Main demonstration notebook showcasing multiple Python libraries
- **`Dockerfile`** - Custom Docker image definition with optimized Python environment
- **`requirements.txt`** - Python dependencies for reproducible environment
- **`.devcontainer/devcontainer.json`** - VS Code Dev Container configuration

### What's Demonstrated

The workshop notebook includes hands-on examples of:

1. **Data Manipulation** (pandas, numpy)

   - Creating and processing datasets
   - Statistical analysis
   - Data cleaning and transformation

2. **Data Visualization** (matplotlib, seaborn, plotly)

   - Static plots and charts
   - Interactive visualizations
   - 3D plotting and dashboards

3. **Web & API Integration** (requests, BeautifulSoup)

   - HTTP requests and API consumption
   - Web scraping techniques
   - Data fetching from external sources

4. **Machine Learning** (scikit-learn)

   - Classification algorithms
   - Model training and evaluation
   - Feature importance analysis

## Learning Outcomes

### Docker Benefits Demonstrated

- ** Environment Isolation**: No conflicts with your local setup
- ** Reproducibility**: Same environment on every machine
- ** Easy Setup**: One command to get started
- ** Consistency**: Everyone uses identical library versions
- ** Portability**: Runs anywhere Docker runs

### Key Concepts Covered

1. **Containerization Fundamentals**

   - What are containers and why use them?
   - Docker vs. virtual machines
   - Container lifecycle management

2. **Dev Containers**

   - VS Code integration
   - Configuration best practices
   - Extension management in containers

3. **Data Science Workflows**
   - Dependency management
   - Jupyter integration
   - Version control with containers

## Technical Details

### Environment Specifications

- **Base Image**: Python 3.11 slim
- **Key Libraries**: pandas 2.0+, matplotlib, seaborn, plotly, scikit-learn
- **Development Tools**: Jupyter Lab, black formatter, flake8 linter
- **Container Features**: Non-root user, optimized caching, security best practices

### Container Features

- **Port Forwarding**: Jupyter Lab (8888), HTTP server (8080), Dev server (3000)
- **Volume Mounting**: Workspace folder mounted for persistent changes
- **Extension Auto-Install**: Python, Jupyter, and development extensions
- **Environment Variables**: Pre-configured for optimal development experience

## Troubleshooting

### Common Issues

**Container won't start:**

- Ensure Docker Desktop is running
- Check available disk space (>2GB recommended)
- Restart Docker Desktop if needed

**Jupyter won't connect:**

- Verify port 8888 is forwarded
- Check the container logs for errors
- Try restarting the container

**Extensions not working:**

- Reload VS Code window
- Check if extensions are installed in container
- Try rebuilding the container

### Debug Commands

```bash
# Check container status
docker ps

# View container logs
docker logs docker-workshop-container

# Execute commands in running container
docker exec -it docker-workshop-container bash

# Rebuild container (if needed)
# In VS Code: Ctrl+Shift+P -> "Dev Containers: Rebuild Container"
```

## Additional Resources

### Docker Learning Resources

- [Docker Official Documentation](https://docs.docker.com/)
- [Docker Best Practices](https://docs.docker.com/develop/best-practices/)
- [Dev Containers Documentation](https://containers.dev/)

### Python Data Science Resources

- [pandas Documentation](https://pandas.pydata.org/docs/)
- [matplotlib Gallery](https://matplotlib.org/stable/gallery/)
- [plotly Documentation](https://plotly.com/python/)
- [scikit-learn User Guide](https://scikit-learn.org/stable/user_guide.html)

## Contributing

Found an issue or have suggestions? We welcome contributions!

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test in the containerized environment
5. Submit a pull request

## License

This workshop is open source and available under the [MIT License](LICENSE).

## Next Steps

After completing this workshop:

1. **Experiment**: Modify the notebook and add your own data analysis
2. **Extend**: Add new libraries to `requirements.txt` and rebuild
3. **Share**: Use this setup as a template for your own projects
4. **Learn More**: Explore Docker Compose for multi-container applications

---

**Happy Dockerizing!**

_BU Data Science Association - Fall 2025_
