.class Lcom/google/protobuf/MapEntry$Metadata$1;
.super Lcom/google/protobuf/AbstractParser;
.source "MapEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/protobuf/MapEntry$Metadata;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;Lcom/google/protobuf/MapEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/AbstractParser",
        "<",
        "Lcom/google/protobuf/MapEntry",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private final dataParser:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/google/protobuf/MapEntryLite",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/protobuf/MapEntry$Metadata;

.field final synthetic val$defaultInstance:Lcom/google/protobuf/MapEntry;

.field final synthetic val$thisMetadata:Lcom/google/protobuf/MapEntry$Metadata;


# direct methods
.method constructor <init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntry;Lcom/google/protobuf/MapEntry$Metadata;)V
    .locals 1
    .param p1, "this$0"    # Lcom/google/protobuf/MapEntry$Metadata;

    .prologue
    .line 62
    .local p0, "this":Lcom/google/protobuf/MapEntry$Metadata$1;, "Lcom/google/protobuf/MapEntry$Metadata$1;"
    iput-object p1, p0, Lcom/google/protobuf/MapEntry$Metadata$1;->this$0:Lcom/google/protobuf/MapEntry$Metadata;

    iput-object p2, p0, Lcom/google/protobuf/MapEntry$Metadata$1;->val$defaultInstance:Lcom/google/protobuf/MapEntry;

    iput-object p3, p0, Lcom/google/protobuf/MapEntry$Metadata$1;->val$thisMetadata:Lcom/google/protobuf/MapEntry$Metadata;

    invoke-direct {p0}, Lcom/google/protobuf/AbstractParser;-><init>()V

    .line 63
    iget-object v0, p0, Lcom/google/protobuf/MapEntry$Metadata$1;->val$defaultInstance:Lcom/google/protobuf/MapEntry;

    .line 64
    # getter for: Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;
    invoke-static {v0}, Lcom/google/protobuf/MapEntry;->access$000(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapEntryLite;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/MapEntryLite;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntry$Metadata$1;->dataParser:Lcom/google/protobuf/Parser;

    .line 63
    return-void
.end method


# virtual methods
.method public parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MapEntry;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/CodedInputStream;",
            "Lcom/google/protobuf/ExtensionRegistryLite;",
            ")",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lcom/google/protobuf/MapEntry$Metadata$1;, "Lcom/google/protobuf/MapEntry$Metadata$1;"
    iget-object v1, p0, Lcom/google/protobuf/MapEntry$Metadata$1;->dataParser:Lcom/google/protobuf/Parser;

    .line 70
    invoke-interface {v1, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/MapEntryLite;

    .line 71
    .local v0, "data":Lcom/google/protobuf/MapEntryLite;, "Lcom/google/protobuf/MapEntryLite<TK;TV;>;"
    new-instance v1, Lcom/google/protobuf/MapEntry;

    iget-object v2, p0, Lcom/google/protobuf/MapEntry$Metadata$1;->val$thisMetadata:Lcom/google/protobuf/MapEntry$Metadata;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lcom/google/protobuf/MapEntry;-><init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntryLite;Lcom/google/protobuf/MapEntry$1;)V

    return-object v1
.end method

.method public bridge synthetic parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lcom/google/protobuf/MapEntry$Metadata$1;, "Lcom/google/protobuf/MapEntry$Metadata$1;"
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/MapEntry$Metadata$1;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MapEntry;

    move-result-object v0

    return-object v0
.end method
