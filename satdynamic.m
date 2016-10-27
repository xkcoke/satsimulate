function [dw] = satdynamic(t, w, I, T)
    T = reshape(T, 3, 1);
    dw = eye(3) / I * (T-cross(w, I*w));
end