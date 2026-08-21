flowchart TD
    A["📄 Fuente .ccdl"] --> B

    subgraph PASE1["Pase 1 — Analisis"]
        B["Tokenizar instrucciones"] --> C["Construir tabla de simbolos"]
        C --> D["Construir tabla de strings"]
    end

    PASE1 --> PASE2

    subgraph PASE2["Pase 2 — Codegen"]
        E["Generar codigo maquina x86"] --> F["Emitir bytes al buffer de salida"]
    end

    PASE2 --> PASE3

    subgraph PASE3["Parches"]
        G["Resolver direcciones de strings"] --> H["Resolver direcciones de etiquetas"]
        H --> I["Escribir datos de strings al final del binario"]
    end

    PASE3 --> J["⚙️ Binario x86 puro (listo para ejecutar)"]

    style A fill:#e1f5fe,stroke:#0288d1,color:#000
    style J fill:#c8e6c9,stroke:#388e3c,color:#000
    style PASE1 fill:#fff3e0,stroke:#f57c00,color:#000
    style PASE2 fill:#fce4ec,stroke:#c62828,color:#000
    style PASE3 fill:#f3e5f5,stroke:#7b1fa2,color:#000
