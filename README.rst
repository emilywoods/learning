=================
My Favourite Tree
=================

This repository contains the application and deployment code for``My Favourite Tree``.

This application contains one endpoint, ``/tree``, which can be accessed via a ``GET`` request and
will return the following json object::

  {"myFavouriteTree":"Elder"}

Development
===========

Prerequisites
-------------

The following tools are required before the application can be installed:

- Python 3.7 or greater
- Docker_
- Minikube_ (used as the deployment environment)

Install
-------

To install the application::

   $ make install

Run
---

To run the application locally::

   $ make run

The application can then be accessed on ``localhost:5000/tree``.

Deployment
==========

This repository contains configuration files to enable deployment to Kubernetes. The
suggested environment for local deployment is Minikube_.

If using ``Minikube``, you must first start your local Kubernetes environment::

  $ minikube start

Then enable local Docker images to be deployed to your cluster::

  $ eval $(minikube docker-env)

Once Minkube is ready, build the image and deploy the application to Kubernetes using::

  $ make build_and_deploy

When all resources are created, you can reach the service using::

  $ curl <MINIKUBE-IP>:80/tree -H Host:local.emilywoods.me

Help
====

To see a full list of the available ``make`` commands, type::

  $ make

Cleanup
========

To clean up all the resources installed locally, run::

  $ make clean


.. _Docker: https://www.docker.com/
.. _Minikube: https://github.com/kubernetes/minikube
