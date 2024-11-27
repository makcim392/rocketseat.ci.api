# CI/CD with Github Actions

## Project overview

This is a simple project to demonstrate how to use Github Actions to build and deploy.


## Best practices

## Key steps of the project

1. Create a new repository over the ```./api``` folder from the devops project.
2. Go into actions section in Github and click on ```setup a workflow yourself```.
3. There will be a .yml file created in the ```./github/workflows``` folder.

![alt text](image.png)

# Lessons learned

## Mistakes on docker file locations

I've originally included the docker files inside the parent folder (```./devops```) which was a mistake, since I'd be going to commit to the CI/CD repository only the ```./api``` folder.

That generated some issues, as I had to re-adapt the file paths in the docker files to match the new location.

# Key takeaways

- Make sure to set the indent spaces correctly in the .yml file, otherwise it will not work. The standard is 2 spaces.