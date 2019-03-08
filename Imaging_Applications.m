%% Imaging Applications and the SVD

L = imread('lena.jpg');
imshow(L);

%% First: What is L? Just a matrix of 0-256 pixel values!
% So, imshow can take in any matrix as input! Try 'drawing' something byu
% inputting your facorite matrix into imshow

%What does 0 correspond to? 256? etc.

%% SVD decomposition
% Here, given some matrix A (you choose!) the svd command computes a
% decompotion of A = USV where
% U,V are square matrices with orthonormal columns, and S is diagonal with
% positive entries. (This is a very useful decompotsition!)

A = L;
[U,S,V] = svd(A);

% This function computes an approximation Ak to A that has very nice
% properites: If U = [ u1 | ... | un ] and V = [ v1 | ... | vn ]^(T)
% and S = diag(s_1, ... s_n)
% Ak = sum_(i=1)^(k) s_i (u_i) (v_k)^T  , (where k <= n)
Ak = @(U,S,V,k) U(:,1:k) * S(1:k,1:k) * V(:,1:k)';

% Dont worry if these are new to you, the imaging part doesn't need you to
% fully understand these!

%% Lets look at these approximations more closely!
% Pick some matrix A of your choice
% compute rank(A) and rank(Ak) for all k =1, ..., rank(A)
% What do you notice?


% Now do the same for the picture of Lena L!


%% Using these functions, plot the kth approximation (Lk) to Lena using imshow
%(choose some values of k that are 'interesting' - some small some large
% What do you notice?

% If you want something visually pleasing, research the 'subplot' command!


%% Now compare the norms of these approximations!
% how does norm(L-Lk) behave? Can you conjecture anything from this?
% How does the SVD behave as an image compression tool?


%% Super interested in Image Processing? See the Matlab 'Wavelet toolbox'
% This contains more modern image processing tools - which are the subject
% of onhoing research today! 
