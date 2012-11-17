require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DeploymentsController do

  # This should return the minimal set of attributes required to create a valid
  # Deploy. As you add validations to Deploy, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DeploysController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all deployments as @deployments" do
      deployment = Deployment.create! valid_attributes
      get :index, {}, valid_session
      assigns(:deployments).should eq([deployment])
    end
  end

  describe "GET show" do
    it "assigns the requested deployment as @deployment" do
      deployment = Deployment.create! valid_attributes
      get :show, {:id => deployment.to_param}, valid_session
      assigns(:deployment).should eq(deployment)
    end
  end

  describe "GET new" do
    it "assigns a new deployment as @deployment" do
      get :new, {}, valid_session
      assigns(:deployment).should be_a_new(Deployment)
    end
  end

  describe "GET edit" do
    it "assigns the requested deployment as @deployment" do
      deployment = Deployment.create! valid_attributes
      get :edit, {:id => deployment.to_param}, valid_session
      assigns(:deployment).should eq(deployment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Deployment" do
        expect {
          post :create, {:deployment => valid_attributes}, valid_session
        }.to change(Deployment, :count).by(1)
      end

      it "assigns a newly created deployment as @deployment" do
        post :create, {:deployment => valid_attributes}, valid_session
        assigns(:deployment).should be_a(Deployment)
        assigns(:deployment).should be_persisted
      end

      it "redirects to the created deployment" do
        post :create, {:deployment => valid_attributes}, valid_session
        response.should redirect_to(Deployment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deployment as @deployment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deployment.any_instance.stub(:save).and_return(false)
        post :create, {:deployment => {}}, valid_session
        assigns(:deployment).should be_a_new(Deployment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deployment.any_instance.stub(:save).and_return(false)
        post :create, {:deployment => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested deployment" do
        deployment = Deployment.create! valid_attributes
        # Assuming there are no other deploys in the database, this
        # specifies that the Deploy created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Deployment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => deployment.to_param, :deployment => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested deployment as @deployment" do
        deployment = Deployment.create! valid_attributes
        put :update, {:id => deployment.to_param, :deployment => valid_attributes}, valid_session
        assigns(:deployment).should eq(deployment)
      end

      it "redirects to the deployment" do
        deployment = Deployment.create! valid_attributes
        put :update, {:id => deployment.to_param, :deployment => valid_attributes}, valid_session
        response.should redirect_to(deployment)
      end
    end

    describe "with invalid params" do
      it "assigns the deployment as @deployment" do
        deployment = Deployment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deployment.any_instance.stub(:save).and_return(false)
        put :update, {:id => deployment.to_param, :deployment => {}}, valid_session
        assigns(:deployment).should eq(deployment)
      end

      it "re-renders the 'edit' template" do
        deployment = Deployment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deployment.any_instance.stub(:save).and_return(false)
        put :update, {:id => deployment.to_param, :deployment => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested deployment" do
      deployment = Deployment.create! valid_attributes
      expect {
        delete :destroy, {:id => deployment.to_param}, valid_session
      }.to change(Deployment, :count).by(-1)
    end

    it "redirects to the deployments list" do
      deployment = Deployment.create! valid_attributes
      delete :destroy, {:id => deployment.to_param}, valid_session
      response.should redirect_to(deployments_url)
    end
  end

end
