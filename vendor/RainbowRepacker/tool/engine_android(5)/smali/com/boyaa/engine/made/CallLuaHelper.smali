.class public Lcom/boyaa/engine/made/CallLuaHelper;
.super Ljava/lang/Object;
.source "CallLuaHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/made/CallLuaHelper$onCallback;
    }
.end annotation


# static fields
.field private static ms_GLView:Lcom/boyaa/engine/made/AppGLSurfaceView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 4
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/engine/made/CallLuaHelper;->ms_GLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    return-void
.end method

.method public static callLua(Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    .locals 2
    .param p0, "func_name"    # Ljava/lang/String;
    .param p1, "cb"    # Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    .prologue
    .line 15
    sget-object v0, Lcom/boyaa/engine/made/CallLuaHelper;->ms_GLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_0

    .line 16
    sget-object v0, Lcom/boyaa/engine/made/CallLuaHelper;->ms_GLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    new-instance v1, Lcom/boyaa/engine/made/CallLuaHelper$1;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/made/CallLuaHelper$1;-><init>(Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 27
    :cond_0
    return-void
.end method

.method public static callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    .locals 2
    .param p0, "func_name"    # Ljava/lang/String;
    .param p1, "args"    # Ljava/lang/String;
    .param p2, "cb"    # Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    .prologue
    .line 30
    sget-object v0, Lcom/boyaa/engine/made/CallLuaHelper;->ms_GLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_0

    .line 31
    sget-object v0, Lcom/boyaa/engine/made/CallLuaHelper;->ms_GLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    new-instance v1, Lcom/boyaa/engine/made/CallLuaHelper$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/boyaa/engine/made/CallLuaHelper$2;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 42
    :cond_0
    return-void
.end method

.method public static init(Lcom/boyaa/engine/made/AppGLSurfaceView;)V
    .locals 0
    .param p0, "gl_view"    # Lcom/boyaa/engine/made/AppGLSurfaceView;

    .prologue
    .line 11
    sput-object p0, Lcom/boyaa/engine/made/CallLuaHelper;->ms_GLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    .line 12
    return-void
.end method
