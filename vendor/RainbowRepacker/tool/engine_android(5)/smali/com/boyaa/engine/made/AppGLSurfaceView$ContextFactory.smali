.class Lcom/boyaa/engine/made/AppGLSurfaceView$ContextFactory;
.super Ljava/lang/Object;
.source "AppGLSurfaceView.java"

# interfaces
.implements Lcom/boyaa/engine/made/GLSurfaceView$EGLContextFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/AppGLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ContextFactory"
.end annotation


# static fields
.field private static EGL_CONTEXT_CLIENT_VERSION:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 218
    const/16 v0, 0x3098

    sput v0, Lcom/boyaa/engine/made/AppGLSurfaceView$ContextFactory;->EGL_CONTEXT_CLIENT_VERSION:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/boyaa/engine/made/AppGLSurfaceView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/boyaa/engine/made/AppGLSurfaceView$1;

    .prologue
    .line 217
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppGLSurfaceView$ContextFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 6
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "eglConfig"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    const/4 v5, 0x2

    .line 220
    # getter for: Lcom/boyaa/engine/made/AppGLSurfaceView;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/engine/made/AppGLSurfaceView;->access$200()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "creating OpenGL ES 2.0 context: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lcom/boyaa/engine/made/AppGLSurfaceView;->createIndex:I
    invoke-static {}, Lcom/boyaa/engine/made/AppGLSurfaceView;->access$300()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    # getter for: Lcom/boyaa/engine/made/AppGLSurfaceView;->createIndex:I
    invoke-static {}, Lcom/boyaa/engine/made/AppGLSurfaceView;->access$300()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    # setter for: Lcom/boyaa/engine/made/AppGLSurfaceView;->createIndex:I
    invoke-static {v2}, Lcom/boyaa/engine/made/AppGLSurfaceView;->access$302(I)I

    .line 222
    const-string v2, "Before eglCreateContext"

    # invokes: Lcom/boyaa/engine/made/AppGLSurfaceView;->checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    invoke-static {v2, p1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->access$400(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V

    .line 223
    const/4 v2, 0x3

    new-array v0, v2, [I

    const/4 v2, 0x0

    sget v3, Lcom/boyaa/engine/made/AppGLSurfaceView$ContextFactory;->EGL_CONTEXT_CLIENT_VERSION:I

    aput v3, v0, v2

    const/4 v2, 0x1

    aput v5, v0, v2

    const/16 v2, 0x3038

    aput v2, v0, v5

    .line 224
    .local v0, "attrib_list":[I
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {p1, p2, p3, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    .line 225
    .local v1, "context":Ljavax/microedition/khronos/egl/EGLContext;
    const-string v2, "After eglCreateContext"

    # invokes: Lcom/boyaa/engine/made/AppGLSurfaceView;->checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    invoke-static {v2, p1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->access$400(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V

    .line 226
    return-object v1
.end method

.method public destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V
    .locals 0
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "context"    # Ljavax/microedition/khronos/egl/EGLContext;

    .prologue
    .line 230
    invoke-interface {p1, p2, p3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 231
    return-void
.end method
